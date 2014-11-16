namespace :export do
  desc "exports your db into the seeds.rb way"
  task :seeds_format => :environment do
    Venue.order(:id).all.each do |venue|
      puts "Venue.create(#{venue.serializable_hash.delete_if {|key, value| ['created_at','updated_at','id'].include?(key)}.to_s.gsub(/[{}]/,'')})"
    end

    Agenda.order(:id).all.each do |agenda|
      puts "Agenda.create(#{agenda.serializable_hash.delete_if {|key, value| ['created_at','updated_at','id'].include?(key)}.to_s.gsub(/[{}]/,'')})"
    end

    Suggestion.order(:id).all.each do |suggestion|
      puts "Suggestion.create(#{suggestion.serializable_hash.delete_if {|key, value| ['created_at','updated_at','id'].include?(key)}.to_s.gsub(/[{}]/,'')})"
    end

  end
end
