class CompetitionInfosController < ApplicationController
  require 'open-uri'
  require 'date'

  def new
    @competition_info = CompetitionInfo.new
  end

  def create
    #ロードの大会情報取得
    if params[:competition_info][:competition_class] == '1'
      #1〜12月分の大会情報を取得
      for month in 1..12 do
        url = 'http://www.runnersbible.info/DB/DBM' + sprintf("%02i", month) + '.html'
        html = open(url) do |f|
          f.read
        end
        doc = Nokogiri::HTML.parse(html, nil, 'utf-8')
        #取得先のテーブル情報が２種類あるので区分分け
        for classification in 1..2 do
          if classification == 1
            competition_info = doc.css('tr.tblo')
          else
            competition_info = doc.css('tr.tble')
          end
          competition_info.each do |info|
            @competition_info = CompetitionInfo.new(competition_info_params)
            #大会HPあるなしで区分
            if info.at('a').nil?
              @competition_info.competition_name = info.css('td')[1].text
              @competition_info.competition_site = ''
            else
              @competition_info.competition_name = info.at('a').text
              competition_site = info.at('a')
              @competition_info.competition_site = competition_site['href']
            end
            competition_day = info.at('td').text.scan(/[^(*]+/)[0].split('.')
            str_competition_day = competition_day[0].to_s + '年' + competition_day[1].to_s + '月' +  competition_day[2].to_s + '日'
            @competition_info.competition_day = Date.strptime(str_competition_day,'%Y年%m月%d日')
            @competition_info.competition_place = info.css('td')[2].text
            unless CompetitionInfo.exists?(competition_day: @competition_info.competition_day, competition_name: @competition_info.competition_name)
              unless @competition_info.save
                render 'new'
              end
            end
          end
        end
      end
    #トレイルの大会情報取得
    else
      now = Date.today
      for classification in 1..2 do
        url = 'https://www.mtsn.jp/special/race_list'
        #本年分データ
        if classification == 1
          str_year = now.year.to_s
          url = url + str_year + '.php'
        #翌年分データ
        else
          str_year = (now.year + 1).to_s
          url = url + str_year + '.php'
        end
        html = open(url) do |f|
          f.read
        end
        doc = Nokogiri::HTML.parse(html, nil, 'utf-8')
        competition_info_table = doc.css('table.race_li_tbl')
        competition_info = competition_info_table.css('tr')
        competition_info.each_with_index do |info, index|
          #最初のループはカラムデータなのでとばす
          if(index > 0)
            @competition_info = CompetitionInfo.new(competition_info_params)
            @competition_info.competition_name = info.at('a').text
            competition_day = info.at('td').text
            str_competition_day = str_year + '年' + competition_day[0,2].to_s + '月' + competition_day[3,2].to_s + '日'
            @competition_info.competition_day = Date.strptime(str_competition_day, '%Y年%m月%d日')
            @competition_info.competition_place = info.css('td')[2].text
            competition_site = info.at('a')
            @competition_info.competition_site = 'https://www.mtsn.jp/' + competition_site['href']
            ## 重複登録回避
            unless CompetitionInfo.exists?(competition_day: @competition_info.competition_day, competition_name: @competition_info.competition_name)
              unless @competition_info.save
                render 'new'
              end
            end
          end
        end
      end ## トレイル区分終了
    end ## ロード・トレイル区分終了
  end ## create終了
end

private

def competition_info_params
  params.require(:competition_info).permit(:competition_class)
end
