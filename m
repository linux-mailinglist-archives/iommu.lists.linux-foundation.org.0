Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 3634D28EC0A
	for <lists.iommu@lfdr.de>; Thu, 15 Oct 2020 06:22:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E8FC78878D;
	Thu, 15 Oct 2020 04:22:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UJmNNWOeCojA; Thu, 15 Oct 2020 04:22:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id DF6EF8876B;
	Thu, 15 Oct 2020 04:22:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BE1D8C0051;
	Thu, 15 Oct 2020 04:22:02 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D8105C0051
 for <iommu@lists.linux-foundation.org>; Thu, 15 Oct 2020 04:22:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id BBF748802A
 for <iommu@lists.linux-foundation.org>; Thu, 15 Oct 2020 04:22:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lyp4Bq7psrW0 for <iommu@lists.linux-foundation.org>;
 Thu, 15 Oct 2020 04:21:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 57A0487F24
 for <iommu@lists.linux-foundation.org>; Thu, 15 Oct 2020 04:21:59 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id az3so1031415pjb.4
 for <iommu@lists.linux-foundation.org>; Wed, 14 Oct 2020 21:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=myKWn2aw1JHwruWf4bmkepVRzhTOK/8xfJ1WsTjjYmk=;
 b=lqZNkqptZUVuKR9lHZ1zEPqnfTwsO69lt6hrzs9rJi06GS3A92tVdrgA9WWsj4rrU0
 EqDtAA+tEmvD4UwaiV6QyDNPdo+wH8giGVEakIvTG9QhQf1XItID/7M9ya4KLRi/HOqV
 Yoq5Fqwpow00+QFN/6NhlBR+UuZrrJ+L6XJTJ4R0DhP6GPBOP3EwRitt+6gYXrtVTEfq
 QlPvyhIXha20eiiTrhI+7/f3Af7+XUTWEEF2/+g+dMuNxgilknqPjvycDN/oQtw0IuKL
 P6nVbs7JaoMoKaFyt05ZfyVa5VtrQVGdyjQAtveq9ND7g+E8W2fOIJsGb4rUf5KjdHC2
 R7hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=myKWn2aw1JHwruWf4bmkepVRzhTOK/8xfJ1WsTjjYmk=;
 b=Hw6qN77KVnYRByDlxWzAPD7tXu4iDZeZ6YB3B6bmQ/FzdLjV4JoxGu6HzIzs9+wrUP
 HEjGttqEHthNyRydpWXt/Fz7pdSTqNUuObJEZnnR+UwgWjfDSkvaovi63mN0mQDIAZEI
 k55cqu8BvcagGB+blc7ArkKthD/YB0ovWpS6QrjuXs7KcnFo6d82p6li9XeN1EuB/4Ot
 Uz6q+EMEGUh+BBkKQCLmb/85WvrZSzrCjdD+6WAaB3RUTbZCnPhFNKXtoW1aI2n/reAQ
 LOXXyF9DIWHkFIBWuBZ2WqqKp9yJ0yQG0ie1SbgYgMd8ussVfxPm3CvBon4hxBzkxrGe
 ZGAg==
X-Gm-Message-State: AOAM5339YCjTFWzLqKEofyKiLGdYoQYuoLM5Z4XJPWidnsYlRxFBwR2O
 DKxiGyZPqsSHqMJrORxlPb8=
X-Google-Smtp-Source: ABdhPJxw6tR6GVDDSYHrsi4pLkqfC+F4ExcRYMfk1T1p55SL/VCxDQAOusd2IB1WQGFK7yUmV/K/dA==
X-Received: by 2002:a17:90a:c58f:: with SMTP id
 l15mr2403427pjt.93.1602735718832; 
 Wed, 14 Oct 2020 21:21:58 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id w143sm1287330pfc.31.2020.10.14.21.21.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 14 Oct 2020 21:21:58 -0700 (PDT)
Date: Wed, 14 Oct 2020 21:13:47 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v7 3/3] iommu/tegra-smmu: Add PCI support
Message-ID: <20201015041346.GA13936@Asurada-Nvidia>
References: <20201009161936.23122-1-nicoleotsuka@gmail.com>
 <20201009161936.23122-4-nicoleotsuka@gmail.com>
 <cbc6e3bf-eedc-195c-c4d6-52d3cd24c257@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cbc6e3bf-eedc-195c-c4d6-52d3cd24c257@arm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: linux-kernel@vger.kernel.org, jonathanh@nvidia.com,
 iommu@lists.linux-foundation.org, thierry.reding@gmail.com,
 linux-tegra@vger.kernel.org, digetx@gmail.com
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

On Wed, Oct 14, 2020 at 06:42:36PM +0100, Robin Murphy wrote:
> On 2020-10-09 17:19, Nicolin Chen wrote:
> > This patch simply adds support for PCI devices.
> > 
> > Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
> > Tested-by: Dmitry Osipenko <digetx@gmail.com>
> > Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> > ---
> > 
> > Changelog
> > v6->v7
> >   * Renamed goto labels, suggested by Thierry.
> > v5->v6
> >   * Added Dmitry's Reviewed-by and Tested-by.
> > v4->v5
> >   * Added Dmitry's Reviewed-by
> > v3->v4
> >   * Dropped !iommu_present() check
> >   * Added CONFIG_PCI check in the exit path
> > v2->v3
> >   * Replaced ternary conditional operator with if-else in .device_group()
> >   * Dropped change in tegra_smmu_remove()
> > v1->v2
> >   * Added error-out labels in tegra_smmu_probe()
> >   * Dropped pci_request_acs() since IOMMU core would call it.
> > 
> >   drivers/iommu/tegra-smmu.c | 35 +++++++++++++++++++++++++----------
> >   1 file changed, 25 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
> > index be29f5977145..2941d6459076 100644
> > --- a/drivers/iommu/tegra-smmu.c
> > +++ b/drivers/iommu/tegra-smmu.c
> > @@ -10,6 +10,7 @@
> >   #include <linux/kernel.h>
> >   #include <linux/of.h>
> >   #include <linux/of_device.h>
> > +#include <linux/pci.h>
> >   #include <linux/platform_device.h>
> >   #include <linux/slab.h>
> >   #include <linux/spinlock.h>
> > @@ -865,7 +866,11 @@ static struct iommu_group *tegra_smmu_device_group(struct device *dev)
> >   	group->smmu = smmu;
> >   	group->soc = soc;
> > -	group->group = iommu_group_alloc();
> > +	if (dev_is_pci(dev))
> > +		group->group = pci_device_group(dev);
> 
> Just to check, is it OK to have two or more swgroups "owning" the same
> iommu_group if an existing one gets returned here? It looks like that might
> not play nice with the use of iommu_group_set_iommudata().

Do you mean by "gets returned here" the "IS_ERR" check below?

> Robin.
> 
> > +	else
> > +		group->group = generic_device_group(dev);
> > +
> >   	if (IS_ERR(group->group)) {
> >   		devm_kfree(smmu->dev, group);
> >   		mutex_unlock(&smmu->lock);
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
