Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 387583D1001
	for <lists.iommu@lfdr.de>; Wed, 21 Jul 2021 15:46:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF50D82F13;
	Wed, 21 Jul 2021 13:46:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WWNJt3f7XAwR; Wed, 21 Jul 2021 13:46:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 0553282F51;
	Wed, 21 Jul 2021 13:46:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D718EC0022;
	Wed, 21 Jul 2021 13:46:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2AA60C000E
 for <iommu@lists.linux-foundation.org>; Wed, 21 Jul 2021 13:46:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 256F640253
 for <iommu@lists.linux-foundation.org>; Wed, 21 Jul 2021 13:46:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pzupHj2WwUxr for <iommu@lists.linux-foundation.org>;
 Wed, 21 Jul 2021 13:46:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.wantstofly.org (hmm.wantstofly.org [213.239.204.108])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5D8FF40234
 for <iommu@lists.linux-foundation.org>; Wed, 21 Jul 2021 13:46:54 +0000 (UTC)
Received: by mail.wantstofly.org (Postfix, from userid 1000)
 id 462307F46A; Wed, 21 Jul 2021 16:46:52 +0300 (EEST)
Date: Wed, 21 Jul 2021 16:46:52 +0300
From: Lennert Buytenhek <buytenh@wantstofly.org>
To: "Suthikulpanit, Suravee" <suravee.suthikulpanit@amd.com>
Subject: Re: [PATCH] iommu/amd: Fix I/O page fault logging ratelimit test
Message-ID: <YPglTERWMajeo6Sj@wantstofly.org>
References: <YPTLl7XHOGp5NiVH@wantstofly.org>
 <79c1cd8b-c680-b3fb-08f0-47c42290d1a4@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <79c1cd8b-c680-b3fb-08f0-47c42290d1a4@amd.com>
Cc: iommu@lists.linux-foundation.org
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

On Tue, Jul 20, 2021 at 07:05:50PM -0500, Suthikulpanit, Suravee wrote:

> Hi Lennert,

Hi Suravee,


> > On an AMD system, I/O page faults are usually logged like this:
> > ....
> > diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
> > index 811a49a95d04..7ae426b092f2 100644
> > --- a/drivers/iommu/amd/iommu.c
> > +++ b/drivers/iommu/amd/iommu.c
> > @@ -483,7 +483,7 @@ static void amd_iommu_report_page_fault(u16 devid, u16 domain_id,
> >   	if (dev_data && __ratelimit(&dev_data->rs)) {
> >   		pci_err(pdev, "Event logged [IO_PAGE_FAULT domain=0x%04x address=0x%llx flags=0x%04x]\n",
> >   			domain_id, address, flags);
> > -	} else if (printk_ratelimit()) {
> > +	} else if (!dev_data && printk_ratelimit()) {
> 
> This seems a bit confusing. Also, according to the following comment in include/linux/printk.h:
> 
> /*
>  * Please don't use printk_ratelimit(), because it shares ratelimiting state
>  * with all other unrelated printk_ratelimit() callsites.  Instead use
>  * printk_ratelimited() or plain old __ratelimit().
>  */
> 
> We probably should move away from using printk_ratelimit() here.
> What about the following change instead?
> 
> diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
> index 811a49a95d04..8eb5d3519743 100644
> --- a/drivers/iommu/amd/iommu.c
> +++ b/drivers/iommu/amd/iommu.c
> @@ -480,11 +480,12 @@ static void amd_iommu_report_page_fault(u16 devid, u16 domain_id,
>         if (pdev)
>                 dev_data = dev_iommu_priv_get(&pdev->dev);
> 
> -       if (dev_data && __ratelimit(&dev_data->rs)) {
> -               pci_err(pdev, "Event logged [IO_PAGE_FAULT domain=0x%04x address=0x%llx flags=0x%04x]\n",
> -                       domain_id, address, flags);
> -       } else if (printk_ratelimit()) {
> -               pr_err("Event logged [IO_PAGE_FAULT device=%02x:%02x.%x domain=0x%04x address=0x%llx flags=0x%04x]\n",
> +       if (dev_data) {
> +               if (__ratelimit(&dev_data->rs))
> +                       pci_err(pdev, "Event logged [IO_PAGE_FAULT domain=0x%04x address=0x%llx flags=0x%04x]\n",
> +                               domain_id, address, flags);
> +       } else {
> +               pr_err_ratelimited("Event logged [IO_PAGE_FAULT device=%02x:%02x.%x domain=0x%04x address=0x%llx flags=0x%04x]\n",
>                         PCI_BUS_NUM(devid), PCI_SLOT(devid), PCI_FUNC(devid),
>                         domain_id, address, flags);
>         }

Looks good!


> Note also that there might be other places in this file that would need
> similar modification as well.

Indeed, there are two more sites like these.

I've sent a new patch that incorporates your feedback.  Thank you!


Cheers,
Lennert
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
