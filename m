Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F6B3DF720
	for <lists.iommu@lfdr.de>; Tue,  3 Aug 2021 23:56:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6EA2404D8;
	Tue,  3 Aug 2021 21:56:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oLObswlao-mY; Tue,  3 Aug 2021 21:56:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id ED048405AA;
	Tue,  3 Aug 2021 21:56:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C0FE3C000E;
	Tue,  3 Aug 2021 21:56:22 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E774FC000E;
 Tue,  3 Aug 2021 21:56:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E298983A96;
 Tue,  3 Aug 2021 21:56:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vj7n82x0uXwd; Tue,  3 Aug 2021 21:56:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1AB1683A95;
 Tue,  3 Aug 2021 21:56:21 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 m20-20020a05600c4f54b029024e75a15716so287644wmq.2; 
 Tue, 03 Aug 2021 14:56:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KEdn0D6XFoulQDVjB2J64O1ReMdifj14YvbOIlyaTQI=;
 b=dpFGs8mmA1hFuSL4jpz3jHKpNgac7w+jttueUZCAeaPh5bMDMCjEuA+iY4dWItsfHZ
 2rN/63GDE8q6/HJ7UoKlfLKL4/NvGDIQ5IQsJPRcajfymUC83xwlzymSZ4AAL48XCWK9
 X16zrfO73pxzRmzwYGTtZGiiusHPUIGtpPaGTIpK67e+5VemfRsAOS+DpfpjvV41zo2A
 DQGBnWMh2cqWthY2jdCnPQHkXMxuU3aV+M3of3lKlnBk5jBMfxCW3V8p00APnZ7dohbc
 c+ZY1EgjLeURvOm4GPtjriQG+wnO2XnfurT5cbTRRBZKaIepE2plupputW/DyKcS0zXC
 PAsQ==
X-Gm-Message-State: AOAM532BS4Oy/YCrkudEaCQ8HI1rMQbnjyhd98JZrCPJc7gtrBP3r3wT
 xW1zn+Xr9nWNLfbPUn0tIEk=
X-Google-Smtp-Source: ABdhPJxaFrCXrIOhbU717JapIDxRtBRTH2yEvUWqOhnXxo7gqhu79AQIfJi2ryqp/mmez67LySI3rA==
X-Received: by 2002:a05:600c:298:: with SMTP id
 24mr24152258wmk.93.1628027779370; 
 Tue, 03 Aug 2021 14:56:19 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id g12sm145022wri.49.2021.08.03.14.56.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 14:56:18 -0700 (PDT)
Date: Tue, 3 Aug 2021 21:56:17 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Praveen Kumar <kumarpraveen@linux.microsoft.com>
Subject: Re: [RFC v1 6/8] mshv: command line option to skip devices in PV-IOMMU
Message-ID: <20210803215617.fzx2vrzhsabrrolc@liuwe-devbox-debian-v2>
References: <20210709114339.3467637-1-wei.liu@kernel.org>
 <20210709114339.3467637-7-wei.liu@kernel.org>
 <4a6918ea-e3e5-55c9-a12d-bee7261301fd@linux.microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4a6918ea-e3e5-55c9-a12d-bee7261301fd@linux.microsoft.com>
Cc: Wei Liu <wei.liu@kernel.org>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, pasha.tatashin@soleen.com,
 Linux on Hyper-V List <linux-hyperv@vger.kernel.org>,
 Will Deacon <will@kernel.org>, Haiyang Zhang <haiyangz@microsoft.com>,
 Dexuan Cui <decui@microsoft.com>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 Michael Kelley <mikelley@microsoft.com>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Nuno Das Neves <nunodasneves@linux.microsoft.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 virtualization@lists.linux-foundation.org,
 Vineeth Pillai <viremana@linux.microsoft.com>
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

On Wed, Aug 04, 2021 at 12:20:42AM +0530, Praveen Kumar wrote:
> On 09-07-2021 17:13, Wei Liu wrote:
> > Some devices may have been claimed by the hypervisor already. One such
> > example is a user can assign a NIC for debugging purpose.
> > 
> > Ideally Linux should be able to tell retrieve that information, but
> > there is no way to do that yet. And designing that new mechanism is
> > going to take time.
> > 
> > Provide a command line option for skipping devices. This is a stopgap
> > solution, so it is intentionally undocumented. Hopefully we can retire
> > it in the future.
> > 
> > Signed-off-by: Wei Liu <wei.liu@kernel.org>
> > ---
> >  drivers/iommu/hyperv-iommu.c | 45 ++++++++++++++++++++++++++++++++++++
> >  1 file changed, 45 insertions(+)
> > 
> > diff --git a/drivers/iommu/hyperv-iommu.c b/drivers/iommu/hyperv-iommu.c
> > index 043dcff06511..353da5036387 100644
> > --- a/drivers/iommu/hyperv-iommu.c
> > +++ b/drivers/iommu/hyperv-iommu.c
> > @@ -349,6 +349,16 @@ static const struct irq_domain_ops hyperv_root_ir_domain_ops = {
> >  
> >  #ifdef CONFIG_HYPERV_ROOT_PVIOMMU
> >  
> > +/* The IOMMU will not claim these PCI devices. */
> > +static char *pci_devs_to_skip;
> > +static int __init mshv_iommu_setup_skip(char *str) {
> > +	pci_devs_to_skip = str;
> > +
> > +	return 0;
> > +}
> > +/* mshv_iommu_skip=(SSSS:BB:DD.F)(SSSS:BB:DD.F) */
> > +__setup("mshv_iommu_skip=", mshv_iommu_setup_skip);
> > +
> >  /* DMA remapping support */
> >  struct hv_iommu_domain {
> >  	struct iommu_domain domain;
> > @@ -774,6 +784,41 @@ static struct iommu_device *hv_iommu_probe_device(struct device *dev)
> >  	if (!dev_is_pci(dev))
> >  		return ERR_PTR(-ENODEV);
> >  
> > +	/*
> > +	 * Skip the PCI device specified in `pci_devs_to_skip`. This is a
> > +	 * temporary solution until we figure out a way to extract information
> > +	 * from the hypervisor what devices it is already using.
> > +	 */
> > +	if (pci_devs_to_skip && *pci_devs_to_skip) {
> > +		int pos = 0;
> > +		int parsed;
> > +		int segment, bus, slot, func;
> > +		struct pci_dev *pdev = to_pci_dev(dev);
> > +
> > +		do {
> > +			parsed = 0;
> > +
> > +			sscanf(pci_devs_to_skip + pos,
> > +				" (%x:%x:%x.%x) %n",
> > +				&segment, &bus, &slot, &func, &parsed);
> > +
> > +			if (parsed <= 0)
> > +				break;
> > +
> > +			if (pci_domain_nr(pdev->bus) == segment &&
> > +				pdev->bus->number == bus &&
> > +				PCI_SLOT(pdev->devfn) == slot &&
> > +				PCI_FUNC(pdev->devfn) == func)
> > +			{
> > +				dev_info(dev, "skipped by MSHV IOMMU\n");
> > +				return ERR_PTR(-ENODEV);
> > +			}
> > +
> > +			pos += parsed;
> > +
> > +		} while (pci_devs_to_skip[pos]);
> 
> Is there a possibility of pci_devs_to_skip + pos > sizeof(pci_devs_to_skip)
> and also a valid memory ?

pos should point to the last parsed position. If parsing fails pos does
not get updated and the code breaks out of the loop. If parsing is
success pos should point to either the start of next element of '\0'
(end of string). To me this is good enough.

> I would recommend to have a check of size as well before accessing the
> array content, just to be safer accessing any memory.
> 

What check do you have in mind?

Wei.

> > +	}
> > +
> >  	vdev = kzalloc(sizeof(*vdev), GFP_KERNEL);
> >  	if (!vdev)
> >  		return ERR_PTR(-ENOMEM);
> > 
> 
> Regards,
> 
> ~Praveen.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
