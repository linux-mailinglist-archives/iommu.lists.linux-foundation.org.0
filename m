Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B22E56A040
	for <lists.iommu@lfdr.de>; Thu,  7 Jul 2022 12:45:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C8D9940CB5;
	Thu,  7 Jul 2022 10:45:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C8D9940CB5
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=b6GFfkBq
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hMhpwySkpwoL; Thu,  7 Jul 2022 10:45:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id AA25B4041C;
	Thu,  7 Jul 2022 10:45:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA25B4041C
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 69691C007D;
	Thu,  7 Jul 2022 10:45:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9AA7EC002D
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jul 2022 10:45:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 759FD419B2
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jul 2022 10:45:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 759FD419B2
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=b6GFfkBq
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oj-6s2IvRh32 for <iommu@lists.linux-foundation.org>;
 Thu,  7 Jul 2022 10:45:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F1D441861
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0F1D441861
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jul 2022 10:45:41 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id q8so9264681ljj.10
 for <iommu@lists.linux-foundation.org>; Thu, 07 Jul 2022 03:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=WY98p2xpQdOFXmhJtt3xHyGiLiAUhi6XRf4hr9Uc3Wg=;
 b=b6GFfkBqjaMf2ocm+NmB4Pdq8BftwMkyn64oPaQ4MV4pvFzFkwxMEQeq6P80Hm4/xV
 qZ+8LuyU5wRQNERGgQNFjcHh58vvfaC0ptqNORWmxffraiT9/DjbcHTSFTsFBlux58Ot
 XhtqsfAx1Sa2gM/tjlsL0QsZtd9LNBgjw9CnnsV557EhbpHb9gCv8v2p+Oj+GmTrlkqp
 mUp+nL+5dVYNjaxqq1uCJh+k/gsHSTvygVI9uMaKcsKBGCdHzMWvDPsDHQivCRNcB3z5
 282ePxgRE2AokBxYCEN4Y+8PqCSOtSZbzmUbIGk4eL7kv/uEwV39B6EvqmW8CS1gOdOi
 UC1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WY98p2xpQdOFXmhJtt3xHyGiLiAUhi6XRf4hr9Uc3Wg=;
 b=dNmqVbtlpZXRbqYYW3VDvJXCT82AcFrKytgiQXA/mYv71i7CxH/gY2AkMOCIRdk1U5
 e+++MVRt/wNzrxY5+7ISI+25nOQARzKNp0mcoXqeglPclnvFwTNJZTKdzK2oZu6Fypvb
 3fDj80DCtIg4oBo3wAfY3DVJBtlRuM1zWzXSVel71hLNFIEnQGATY1D41IVKjiv3ktPR
 ZaaFHPw1fSEiuPm7sPpiuxp9vd9EQ/CyeEffgz3b8garEdCjmTB2dCXPG6jnyLyRa8+B
 KY5tmjwuqmNI6NSoyVOprKyWz/ZdYgkrB+PDX4WkU5hEDejlSTe5HQTRwCShTt0t+V+n
 drfQ==
X-Gm-Message-State: AJIora+bjsdaQaFy31+rA3tihTojm9ROMB4CXK7ChuOXPk5apNIcAe+2
 XxYZNSp1AZfqPVhzlfE604c=
X-Google-Smtp-Source: AGRyM1u/4QG+lv01OuNQRv5dICfp1iMojBGdOQCB054Of0nHO6eJIDlEiA+XLi20gZMrDBLB66OBnA==
X-Received: by 2002:a05:651c:158a:b0:25d:1cc9:3ce7 with SMTP id
 h10-20020a05651c158a00b0025d1cc93ce7mr13652854ljq.450.1657190739851; 
 Thu, 07 Jul 2022 03:45:39 -0700 (PDT)
Received: from mobilestation ([95.79.140.178])
 by smtp.gmail.com with ESMTPSA id
 g2-20020a056512118200b0047f701f6d09sm6766233lfr.184.2022.07.07.03.45.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 03:45:37 -0700 (PDT)
Date: Thu, 7 Jul 2022 13:45:33 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v3 1/8] irqchip/mips-gic: Only register IPI domain when
 SMP is enabled
Message-ID: <20220707104533.7iakliv2f5i2qi33@mobilestation>
References: <20220701200056.46555-1-samuel@sholland.org>
 <20220701200056.46555-2-samuel@sholland.org>
 <20220705135243.ydbwfo4kois64elr@mobilestation>
 <87czehmiwt.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87czehmiwt.wl-maz@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 linux-hyperv@vger.kernel.org, Rich Felker <dalias@libc.org>,
 linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-pci@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Jan Beulich <jbeulich@suse.com>,
 "H. Peter Anvin" <hpa@zytor.com>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Sven Schnelle <svens@stackframe.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Rob Herring <robh@kernel.org>,
 Wei Liu <wei.liu@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, kernel test robot <lkp@intel.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Samuel Holland <samuel@sholland.org>, Will Deacon <will@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, x86@kernel.org,
 Dexuan Cui <decui@microsoft.com>, Russell King <linux@armlinux.org.uk>,
 Wei Xu <xuwei5@hisilicon.com>, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Ingo Molnar <mingo@redhat.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 xen-devel@lists.xenproject.org, Matt Turner <mattst88@gmail.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-xtensa@linux-xtensa.org,
 Kees Cook <keescook@chromium.org>, Haiyang Zhang <haiyangz@microsoft.com>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Maximilian Heyne <mheyne@amazon.de>, Bjorn Helgaas <bhelgaas@google.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Richard Henderson <rth@twiddle.net>, Juergen Gross <jgross@suse.com>,
 Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 Julia Lawall <Julia.Lawall@inria.fr>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 iommu@lists.linux-foundation.org, linux-alpha@vger.kernel.org,
 Borislav Petkov <bp@alien8.de>, Colin Ian King <colin.king@intel.com>,
 Helge Deller <deller@gmx.de>
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

On Thu, Jul 07, 2022 at 09:22:26AM +0100, Marc Zyngier wrote:
> On Tue, 05 Jul 2022 14:52:43 +0100,
> Serge Semin <fancer.lancer@gmail.com> wrote:
> > 
> > Hi Samuel
> > 
> > On Fri, Jul 01, 2022 at 03:00:49PM -0500, Samuel Holland wrote:
> > > The MIPS GIC irqchip driver may be selected in a uniprocessor
> > > configuration, but it unconditionally registers an IPI domain.
> > > 
> > > Limit the part of the driver dealing with IPIs to only be compiled when
> > > GENERIC_IRQ_IPI is enabled, which corresponds to an SMP configuration.
> > 
> > Thanks for the patch. Some comment is below.
> > 
> > > 
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Signed-off-by: Samuel Holland <samuel@sholland.org>
> > > ---
> > > 
> > > Changes in v3:
> > >  - New patch to fix build errors in uniprocessor MIPS configs
> > > 
> > >  drivers/irqchip/Kconfig        |  3 +-
> > >  drivers/irqchip/irq-mips-gic.c | 80 +++++++++++++++++++++++-----------
> > >  2 files changed, 56 insertions(+), 27 deletions(-)
> > > 
> > > diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> > > index 1f23a6be7d88..d26a4ff7c99f 100644
> > > --- a/drivers/irqchip/Kconfig
> > > +++ b/drivers/irqchip/Kconfig
> > > @@ -322,7 +322,8 @@ config KEYSTONE_IRQ
> > >  
> > >  config MIPS_GIC
> > >  	bool
> > > -	select GENERIC_IRQ_IPI
> > > +	select GENERIC_IRQ_IPI if SMP
> > 
> > > +	select IRQ_DOMAIN_HIERARCHY
> > 
> > It seems to me that the IRQ domains hierarchy is supposed to be
> > created only if IPI is required. At least that's what the MIPS GIC
> > driver implies. Thus we can go further and CONFIG_IRQ_DOMAIN_HIERARCHY
> > ifdef-out the gic_irq_domain_alloc() and gic_irq_domain_free()
> > methods definition together with the initialization:
> > 
> >  static const struct irq_domain_ops gic_irq_domain_ops = {
> >  	.xlate = gic_irq_domain_xlate,
> > +#ifdef CONFIG_IRQ_DOMAIN_HIERARCHY
> >  	.alloc = gic_irq_domain_alloc,
> >  	.free = gic_irq_domain_free,
> > +#endif
> >  	.map = gic_irq_domain_map,
> > };
> > 
> > If the GENERIC_IRQ_IPI config is enabled, CONFIG_IRQ_DOMAIN_HIERARCHY
> > will be automatically selected (see the config definition in
> > kernel/irq/Kconfig). If the IRQs hierarchy is needed for some another
> > functionality like GENERIC_MSI_IRQ_DOMAIN or GPIOs then they will
> > explicitly enable the IRQ_DOMAIN_HIERARCHY config thus activating the
> > denoted .alloc and .free methods definitions.
> > 
> > To sum up you can get rid of the IRQ_DOMAIN_HIERARCHY config
> > force-select from this patch and make the MIPS GIC driver code a bit
> > more coherent.
> > 
> > @Marc, please correct me if were wrong.
> 

> Either way probably works correctly, but Samuel's approach is more
> readable IMO. It is far easier to reason about a high-level feature
> (GENERIC_IRQ_IPI) than an implementation detail (IRQ_DOMAIN_HIERARCHY).
> 

The main idea of my comment was to get rid of the forcible
IRQ_DOMAIN_HIERARCHY config selection, because the basic part of the
driver doesn't depends on the hierarchical IRQ-domains functionality.
It's needed only for IPIs and implicitly for the lower level IRQ
device drivers like GPIO or PCIe-controllers, which explicitly enable
the IRQ_DOMAIN_HIERARCHY config anyway. That's why instead of forcible
IRQ_DOMAIN_HIERARCHY config selection (see Samuel patch) I suggested
to make the corresponding functionality defined under the
IRQ_DOMAIN_HIERARCHY config ifdefs, thus having the driver capable of
creating the hierarchical IRQs domains only if it's required.

> If you really want to save a handful of bytes, you can make the
> callbacks conditional on GENERIC_IRQ_IPI, and be done with it.

AFAIU I can't in this case. It must be either IRQ_DOMAIN_HIERARCHY
ifdefs or explicit IRQ_DOMAIN_HIERARCHY select. There can be non-SMP
(UP) systems with no need in IPIs but for instance having a GPIO or
PCIe controller which require the hierarchical IRQ-domains support of
the parental IRQ controller. So making the callbacks definition
depended on the GENERIC_IRQ_IPI config state will break the driver for
these systems. That's why I suggested to use
CONFIG_IRQ_DOMAIN_HIERARCHY which activates the hierarchical IRQ
domains support in the IRQ-chip system (see the irq_domain_ops
structure conditional fields definition) and shall we have the
suggested approach implemented in the MIPS GIC driver.

-Sergey

> But this can come as an additional patch.
> 
> Thanks,
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
