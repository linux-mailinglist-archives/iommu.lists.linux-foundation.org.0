Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 480F62E8A6B
	for <lists.iommu@lfdr.de>; Sun,  3 Jan 2021 05:09:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AD5D58453D;
	Sun,  3 Jan 2021 04:09:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HI_RP6DZPmcx; Sun,  3 Jan 2021 04:09:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 49F9285D59;
	Sun,  3 Jan 2021 04:09:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3C350C013A;
	Sun,  3 Jan 2021 04:09:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CBE1AC013A
 for <iommu@lists.linux-foundation.org>; Sun,  3 Jan 2021 04:08:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id BAD0C85D59
 for <iommu@lists.linux-foundation.org>; Sun,  3 Jan 2021 04:08:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DxDP_i-rsT0z for <iommu@lists.linux-foundation.org>;
 Sun,  3 Jan 2021 04:08:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from zju.edu.cn (spam.zju.edu.cn [61.164.42.155])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 4219D8453D
 for <iommu@lists.linux-foundation.org>; Sun,  3 Jan 2021 04:08:56 +0000 (UTC)
Received: by ajax-webmail-mail-app3 (Coremail) ; Sun, 3 Jan 2021 12:08:31
 +0800 (GMT+08:00)
X-Originating-IP: [222.205.25.254]
Date: Sun, 3 Jan 2021 12:08:31 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: dinghao.liu@zju.edu.cn
To: "Lu Baolu" <baolu.lu@linux.intel.com>
Subject: Re: Re: [PATCH] iommu/intel: Fix memleak in intel_irq_remapping_alloc
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20200917(3e19599d)
 Copyright (c) 2002-2021 www.mailtech.cn zju.edu.cn
In-Reply-To: <18add30d-a830-c531-6fd2-58a1898b157f@linux.intel.com>
References: <20210102095029.29053-1-dinghao.liu@zju.edu.cn>
 <18add30d-a830-c531-6fd2-58a1898b157f@linux.intel.com>
MIME-Version: 1.0
Message-ID: <50870a42.15f1a.176c66eaf92.Coremail.dinghao.liu@zju.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: cC_KCgDnjw0_Q_FfeFRHAA--.14395W
X-CM-SenderInfo: qrrzjiaqtzq6lmxovvfxof0/1tbiAgIOBlZdtRzYgwAAsx
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

> Hi,
> 
> On 2021/1/2 17:50, Dinghao Liu wrote:
> > When irq_domain_get_irq_data() or irqd_cfg() fails
> > meanwhile i == 0, data allocated by kzalloc() has not
> > been freed before returning, which leads to memleak.
> > 
> > Fixes: b106ee63abccb ("irq_remapping/vt-d: Enhance Intel IR driver to support hierarchical irqdomains")
> > Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
> > ---
> >   drivers/iommu/intel/irq_remapping.c | 2 ++
> >   1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/iommu/intel/irq_remapping.c b/drivers/iommu/intel/irq_remapping.c
> > index aeffda92b10b..cdaeed36750f 100644
> > --- a/drivers/iommu/intel/irq_remapping.c
> > +++ b/drivers/iommu/intel/irq_remapping.c
> > @@ -1354,6 +1354,8 @@ static int intel_irq_remapping_alloc(struct irq_domain *domain,
> >   		irq_cfg = irqd_cfg(irq_data);
> >   		if (!irq_data || !irq_cfg) {
> >   			ret = -EINVAL;
> > +			kfree(data);
> > +			data = NULL;
> 
> Do you need to check (i == 0) here? @data will not be used anymore as it
> goes to out branch, why setting it to NULL here?
> 

data will be passed to ire_data->chip_data when i == 0 and 
intel_free_irq_resources() will free it on failure. Thus I
set it to NULL to prevent double-free. However, if we add 
a check (i == 0) here, we will not need to set it to NULL.
If this is better, I will resend a new patch soon.

Regards,
Dinghao 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
