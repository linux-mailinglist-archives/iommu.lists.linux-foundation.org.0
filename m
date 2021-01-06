Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4122EBC1D
	for <lists.iommu@lfdr.de>; Wed,  6 Jan 2021 11:10:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9DFD485142;
	Wed,  6 Jan 2021 10:10:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yc_9jE3l_5F9; Wed,  6 Jan 2021 10:10:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B76778502C;
	Wed,  6 Jan 2021 10:10:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 97973C1E6F;
	Wed,  6 Jan 2021 10:10:06 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E07FAC013A
 for <iommu@lists.linux-foundation.org>; Wed,  6 Jan 2021 10:10:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 92C8C204A8
 for <iommu@lists.linux-foundation.org>; Wed,  6 Jan 2021 10:10:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PhoNio-jEuFA for <iommu@lists.linux-foundation.org>;
 Wed,  6 Jan 2021 10:10:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by silver.osuosl.org (Postfix) with ESMTPS id 19EB0204AC
 for <iommu@lists.linux-foundation.org>; Wed,  6 Jan 2021 10:10:03 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id e25so2140898wme.0
 for <iommu@lists.linux-foundation.org>; Wed, 06 Jan 2021 02:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=pYyg30QaTDPl/1SfAlH9RTsVh8+8mZmaYN21GkgmjzE=;
 b=dU+TthxcMGjTtNTHgAxVXU4RoesYX0+g99WP06hov8k5+rSF25PGYGQgv+pYLH9ckG
 cpOFnAM0PAAI7YejQrIJHu5grW+Yi0ZytOjyTDq/H1o74sD4vZRshf+L3csjqFLxW04I
 B1gNIOTJzvmEka1ljIVPJmu6F0U/alZBd99XxiQxOUphUvxWFEaAi8os+miAjfa1icSB
 83os8+fz8W51CuiINLjCJmLG927DS2go5laF4PedUBdUlA1PKI1uIVChN1xY9eJjUpxV
 RSjEOgm+EiZVG/ijwACZGfwbxljK4OLRJoJucnkx1tAOEGGVIF9ylAwN+JLGXggtn/n+
 UvNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pYyg30QaTDPl/1SfAlH9RTsVh8+8mZmaYN21GkgmjzE=;
 b=lxQza24p9bojUc8aLYZIYyfpFIng7ey6YhiotmRi2K9KNKI8JwQIcv8Aov+g7W7iY3
 K5ZX3dGRdNNqrsBgs0ag8aEy0bHYskjGuetMgh3ke5wFmjhaBfV6VaxGu+KUHgLFRsj+
 BhFbSCw+9l58imc3xcSa5e67bw1hxetDUN29Km6eoXBg8Leoci33CLIgPxeq43GovOLc
 Bn7l95xvsGpFJgIcUaAR1ashKc9Z12mUblgYlPiwUAvRI1qIeeZdjWoxPiGuEYFyh0RQ
 tgHfW3geUNt1Tzp7mbv3b7Nl47npumLS820r3UVnm8oMSqqjqG0HFqZGVfidOtuDD5Lz
 Z2SA==
X-Gm-Message-State: AOAM533EsBzRMcxwytIxTm5uSnCPyX+nGal3sF3TGsoNXlXMyBY6MzQW
 gVAOU8vBXRQx2zjhrwFXtG1nOg==
X-Google-Smtp-Source: ABdhPJyYTgg3A5KVgYhik+U4iGyzXTzZ8PYLdEnALeRQjjVy1s7B3PnwykM8rNUrBWLGefy5aB2J7w==
X-Received: by 2002:a1c:4c14:: with SMTP id z20mr3009430wmf.149.1609927801506; 
 Wed, 06 Jan 2021 02:10:01 -0800 (PST)
Received: from myrica ([2001:1715:4e26:a7e0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id r7sm2394874wmh.2.2021.01.06.02.10.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jan 2021 02:10:00 -0800 (PST)
Date: Wed, 6 Jan 2021 11:09:42 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Krishna Reddy <vdumpa@nvidia.com>
Subject: Re: [PATCH v10 11/13] iommu/arm-smmu-v3: Add SVA device feature
Message-ID: <X/WMZgVFs0F2H0vy@myrica>
References: <20200918101852.582559-1-jean-philippe@linaro.org>
 <20200918101852.582559-12-jean-philippe@linaro.org>
 <BY5PR12MB3764F5D07E8EC48327E39C86B3C60@BY5PR12MB3764.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BY5PR12MB3764F5D07E8EC48327E39C86B3C60@BY5PR12MB3764.namprd12.prod.outlook.com>
Cc: Sachin Nikam <Snikam@nvidia.com>,
 "fenghua.yu@intel.com" <fenghua.yu@intel.com>,
 Terje Bergstrom <tbergstrom@nvidia.com>,
 Nate Watterson <nwatterson@nvidia.com>, "will@kernel.org" <will@kernel.org>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 Alistair Popple <apopple@nvidia.com>, Yu-Huan Hsu <YHsu@nvidia.com>,
 Pritesh Raithatha <praithatha@nvidia.com>, Vikram Sethi <vsethi@nvidia.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Nicolin Chen <nicolinc@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
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

Hi,

On Tue, Dec 15, 2020 at 01:09:29AM +0000, Krishna Reddy wrote:
> Hi Jean,
> 
> > +bool arm_smmu_master_sva_supported(struct arm_smmu_master *master) {
> > +       if (!(master->smmu->features & ARM_SMMU_FEAT_SVA))
> > +               return false;
> +
> > +       /* SSID and IOPF support are mandatory for the moment */
> > +       return master->ssid_bits && arm_smmu_iopf_supported(master); }
> > +
> 
> Tegra Next Gen SOC has arm-smmu-v3 and It doesn't have support for PRI interface.
> However, PCIe client device has capability to handle the page faults on its own when the ATS translation fails.
> The PCIe device needs SVA feature enable without PRI interface supported at arm-smmu-v3.
> At present, the SVA feature enable is allowed only if the smmu/client device has PRI support. 
> There seem to be no functional reason to make pri_supported as a pre-requisite for SVA enable.

The pri_supported check allows drivers to query whether the SMMU is
compatible with their capability. It's pointless, for example, to enable
SVA for a PRI-capable device if the SMMU doesn't support PRI.

I agree that we should let a device driver enable SVA if it supports some
form of IOPF. Perhaps we could extract the IOPF capability from
IOMMU_DEV_FEAT_SVA, into a new IOMMU_DEV_FEAT_IOPF feature. Device drivers
that rely on PRI or stall can first check FEAT_IOPF, then FEAT_SVA, and
enable both separately. Enabling FEAT_SVA would require FEAT_IOPF enabled
if supported. Let me try to write this up.

Thanks,
Jean

> Can SVA enable be supported for pri_supported not set case as well? 
> Also, It is noticed that SVA  enable on Intel doesn't need pri_supported set. 
> 
> -KR
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
