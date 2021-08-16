###RM_enzymes: gene list 
###s_df: the dataframe of gene expression 
###s_df: col: class:tumor/normal; cancertype:cancer names; value:gene express ;value gene: gene name

for (i in 1:length(RM_enzymes)){
  x=RM_enzymes[i]
  png = paste(x,".png",sep = "")
  seegene = subset(s_df,gene==x)
  p = ggplot(data = seegene,aes(x=class,y = value,fill=class))+geom_boxplot()+ggtitle(x) +
    theme(plot.title = element_text(hjust = 0.5)) 
  q=facet(p,facet.by= "cancertype",nrow =7
          ,scales = "free_y")+stat_compare_means()+geom_jitter(width = 0.1, height = 3.8,shape=21,alpha=0.15)
  q
  png(filename = png,width =2000,height = 1500,res = 200)
  print(q)
  dev.off()
}