ActiveAdmin.register Category do

	index do
		id_column
		column :title
		column :image do |cat|
			image_tag cat.image(:thumbnail) if cat.image?
		end
		default_actions
	end


	form do |f|
		f.inputs do
			f.input :title
			f.input :image
		end

		f.buttons
	end


end
