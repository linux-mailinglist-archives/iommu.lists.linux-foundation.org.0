Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A813000F4
	for <lists.iommu@lfdr.de>; Fri, 22 Jan 2021 11:59:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 444822E0DA;
	Fri, 22 Jan 2021 10:59:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AdCSucQ0naCp; Fri, 22 Jan 2021 10:59:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id DFD782E0DB;
	Fri, 22 Jan 2021 10:59:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C7378C013A;
	Fri, 22 Jan 2021 10:59:23 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6FB5DC013A
 for <iommu@lists.linux-foundation.org>; Fri, 22 Jan 2021 10:59:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6171F845D7
 for <iommu@lists.linux-foundation.org>; Fri, 22 Jan 2021 10:59:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nk7mzZE2X3Fc for <iommu@lists.linux-foundation.org>;
 Fri, 22 Jan 2021 10:59:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id AA9A084415
 for <iommu@lists.linux-foundation.org>; Fri, 22 Jan 2021 10:59:19 +0000 (UTC)
Received: from fraeml710-chm.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4DMbkY5sG2z67dSX;
 Fri, 22 Jan 2021 18:55:01 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml710-chm.china.huawei.com (10.206.15.59) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 22 Jan 2021 11:59:15 +0100
Received: from localhost (10.47.73.222) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Fri, 22 Jan
 2021 10:59:13 +0000
Date: Fri, 22 Jan 2021 10:58:32 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v10 10/10] iommu/arm-smmu-v3: Add stall support for
 platform devices
Message-ID: <20210122105832.00002dcb@Huawei.com>
In-Reply-To: <YAqSCKeN2o+GsISZ@myrica>
References: <20210121123623.2060416-1-jean-philippe@linaro.org>
 <20210121123623.2060416-11-jean-philippe@linaro.org>
 <20210121191236.00000103@Huawei.com> <YAqSCKeN2o+GsISZ@myrica>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.47.73.222]
X-ClientProxiedBy: lhreml750-chm.china.huawei.com (10.201.108.200) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Cc: vivek.gautam@arm.com, guohanjun@huawei.com, will@kernel.org,
 linux-acpi@vger.kernel.org, zhangfei.gao@linaro.org, lenb@kernel.org,
 devicetree@vger.kernel.org, kevin.tian@intel.com, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, rjw@rjwysocki.net,
 iommu@lists.linux-foundation.org, sudeep.holla@arm.com, robin.murphy@arm.com,
 linux-accelerators@lists.ozlabs.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development issues for Linux IOMMU support
 <iommu.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
 <mailto:iommu-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu@lists.linux-foundation.org>
List-Help: <mailto:iommu-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
 <mailto:iommu-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Fri, 22 Jan 2021 09:51:20 +0100
Jean-Philippe Brucker <jean-philippe@linaro.org> wrote:

> On Thu, Jan 21, 2021 at 07:12:36PM +0000, Jonathan Cameron wrote:
> > > @@ -2502,6 +2647,7 @@ static void arm_smmu_release_device(struct device *dev)
> > >  
> > >  	master = dev_iommu_priv_get(dev);
> > >  	WARN_ON(arm_smmu_master_sva_enabled(master));
> > > +	iopf_queue_remove_device(master->smmu->evtq.iopf, dev);
> > >  	arm_smmu_detach_dev(master);
> > >  	arm_smmu_disable_pasid(master);
> > >  	arm_smmu_remove_master(master);  
> > 
> > The lack of symmetry here bothers me a bit, but it's already true, so I guess
> > this case is fine as well.  
> 
> Normally the device driver calls iommu_dev_feat_disable(SVA) which does
> iopf_queue_remove_device(). This is just a safety net in case the device
> gets removed without the driver properly cleaning up (which will WARN as
> well) 

Ah makes sense.  Maybe it's worth a comment in the code for future generations
of tired code readers?

> 
> > 
> > ...  
> > >  
> > > @@ -2785,6 +2946,7 @@ static int arm_smmu_cmdq_init(struct arm_smmu_device *smmu)
> > >  static int arm_smmu_init_queues(struct arm_smmu_device *smmu)
> > >  {
> > >  	int ret;
> > > +	bool sva = smmu->features & ARM_SMMU_FEAT_STALLS;  
> > 
> > FEAT_SVA?  
> 
> Ugh yes, thanks. I left this as a bool instead of moving into the test
> below because the PRI patch reuses it, but I think I'll just move it down
> when resending.

Makes sense.

> 
> Thanks,
> Jean
> 
> >   
> > >  
> > >  	/* cmdq */
> > >  	ret = arm_smmu_init_one_queue(smmu, &smmu->cmdq.q, ARM_SMMU_CMDQ_PROD,
> > > @@ -2804,6 +2966,12 @@ static int arm_smmu_init_queues(struct arm_smmu_device *smmu)
> > >  	if (ret)
> > >  		return ret;
> > >  
> > > +	if (sva && smmu->features & ARM_SMMU_FEAT_STALLS) {  
> > 
> > Isn't this checking same thing twice?
> >   
> > > +		smmu->evtq.iopf = iopf_queue_alloc(dev_name(smmu->dev));
> > > +		if (!smmu->evtq.iopf)
> > > +			return -ENOMEM;
> > > +	}
> > > +
> > >  	/* priq */
> > >  	if (!(smmu->features & ARM_SMMU_FEAT_PRI))
> > >  		return 0;
> > > @@ -3718,6 +3886,7 @@ static int arm_smmu_device_remove(struct platform_device *pdev)
> > >  	iommu_device_unregister(&smmu->iommu);
> > >  	iommu_device_sysfs_remove(&smmu->iommu);
> > >  	arm_smmu_device_disable(smmu);
> > > +	iopf_queue_free(smmu->evtq.iopf);
> > >  
> > >  	return 0;
> > >  }  
> >   

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
