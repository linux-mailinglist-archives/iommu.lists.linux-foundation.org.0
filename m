Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 977192E8B23
	for <lists.iommu@lfdr.de>; Sun,  3 Jan 2021 07:22:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A84C9204F3;
	Sun,  3 Jan 2021 06:22:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id epnwHq80YY7h; Sun,  3 Jan 2021 06:22:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 78EEE204F2;
	Sun,  3 Jan 2021 06:22:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 70573C013A;
	Sun,  3 Jan 2021 06:22:43 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4DF06C013A
 for <iommu@lists.linux-foundation.org>; Sun,  3 Jan 2021 06:22:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 2E6D5204F2
 for <iommu@lists.linux-foundation.org>; Sun,  3 Jan 2021 06:22:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SBBq8fHowZ4P for <iommu@lists.linux-foundation.org>;
 Sun,  3 Jan 2021 06:22:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from zju.edu.cn (spam.zju.edu.cn [61.164.42.155])
 by silver.osuosl.org (Postfix) with ESMTP id 599E32048B
 for <iommu@lists.linux-foundation.org>; Sun,  3 Jan 2021 06:22:37 +0000 (UTC)
Received: by ajax-webmail-mail-app2 (Coremail) ; Sun, 3 Jan 2021 14:22:11
 +0800 (GMT+08:00)
X-Originating-IP: [10.192.85.18]
Date: Sun, 3 Jan 2021 14:22:11 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: dinghao.liu@zju.edu.cn
To: "Lu Baolu" <baolu.lu@linux.intel.com>
Subject: Re: Re: [PATCH] iommu/intel: Fix memleak in intel_irq_remapping_alloc
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20200917(3e19599d)
 Copyright (c) 2002-2021 www.mailtech.cn zju.edu.cn
In-Reply-To: <6e1ce9ac-ac17-2b16-84d3-a18c011768f2@linux.intel.com>
References: <20210102095029.29053-1-dinghao.liu@zju.edu.cn>
 <18add30d-a830-c531-6fd2-58a1898b157f@linux.intel.com>
 <50870a42.15f1a.176c66eaf92.Coremail.dinghao.liu@zju.edu.cn>
 <6e1ce9ac-ac17-2b16-84d3-a18c011768f2@linux.intel.com>
MIME-Version: 1.0
Message-ID: <3b0b2129.17762.176c6e9114d.Coremail.dinghao.liu@zju.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: by_KCgCnr+uTYvFff_1QAA--.14443W
X-CM-SenderInfo: qrrzjiaqtzq6lmxovvfxof0/1tbiAg0OBlZdtRzbxwAAs5
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
 CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
 daVFxhVjvjDU=
Cc: Will Deacon <will@kernel.org>, kjlu@umn.edu, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Thomas Gleixner <tglx@linutronix.de>,
 David Woodhouse <dwmw2@infradead.org>, Jiang Liu <jiang.liu@linux.intel.com>
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

> On 2021/1/3 12:08, dinghao.liu@zju.edu.cn wrote:
> >> Hi,
> >>
> >> On 2021/1/2 17:50, Dinghao Liu wrote:
> >>> When irq_domain_get_irq_data() or irqd_cfg() fails
> >>> meanwhile i == 0, data allocated by kzalloc() has not
> >>> been freed before returning, which leads to memleak.
> >>>
> >>> Fixes: b106ee63abccb ("irq_remapping/vt-d: Enhance Intel IR driver to support hierarchical irqdomains")
> >>> Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
> >>> ---
> >>>    drivers/iommu/intel/irq_remapping.c | 2 ++
> >>>    1 file changed, 2 insertions(+)
> >>>
> >>> diff --git a/drivers/iommu/intel/irq_remapping.c b/drivers/iommu/intel/irq_remapping.c
> >>> index aeffda92b10b..cdaeed36750f 100644
> >>> --- a/drivers/iommu/intel/irq_remapping.c
> >>> +++ b/drivers/iommu/intel/irq_remapping.c
> >>> @@ -1354,6 +1354,8 @@ static int intel_irq_remapping_alloc(struct irq_domain *domain,
> >>>    		irq_cfg = irqd_cfg(irq_data);
> >>>    		if (!irq_data || !irq_cfg) {
> >>>    			ret = -EINVAL;
> >>> +			kfree(data);
> >>> +			data = NULL;
> >>
> >> Do you need to check (i == 0) here? @data will not be used anymore as it
> >> goes to out branch, why setting it to NULL here?
> >>
> > 
> > data will be passed to ire_data->chip_data when i == 0 and
> > intel_free_irq_resources() will free it on failure. Thus I
> 
> Isn't it going to "goto out_free_data"? If "i == 0", the allocated @data
> won't be freed by intel_free_irq_resources(), hence memory leaking. Does
> this patch aim to fix this?
> 
> Best regards,
> baolu
> 

Correct, this is what I mean. When i > 0, data has been passed to
irq_data->chip_data, which will be freed in intel_free_irq_resources()
on failure. So there is no memleak in this case. The memleak only occurs
on failure when i == 0 (data has not been passed to irq_data->chip_data).
I set data to NULL after kfree() in this patch to prevent double-free
when the failure occurs at i > 0.

Regards,
Dinghao

> > set it to NULL to prevent double-free. However, if we add
> > a check (i == 0) here, we will not need to set it to NULL.
> > If this is better, I will resend a new patch soon.
> > 
> > Regards,
> > Dinghao
> > 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
