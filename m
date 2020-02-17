Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 6221F16123C
	for <lists.iommu@lfdr.de>; Mon, 17 Feb 2020 13:40:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 158FD85629;
	Mon, 17 Feb 2020 12:40:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p2bNeIHQ3vdq; Mon, 17 Feb 2020 12:40:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 28B0C85374;
	Mon, 17 Feb 2020 12:40:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0F1D9C1D89;
	Mon, 17 Feb 2020 12:40:42 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BA045C013E
 for <iommu@lists.linux-foundation.org>; Mon, 17 Feb 2020 12:40:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B63B784755
 for <iommu@lists.linux-foundation.org>; Mon, 17 Feb 2020 12:40:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MP1AASro2lCP for <iommu@lists.linux-foundation.org>;
 Mon, 17 Feb 2020 12:40:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B1B0F8457E
 for <iommu@lists.linux-foundation.org>; Mon, 17 Feb 2020 12:40:38 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id t14so18294927wmi.5
 for <iommu@lists.linux-foundation.org>; Mon, 17 Feb 2020 04:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=VM4sr45eMsFNfm3I8AuewKPZ2mzCi8kc40UVw+7O2LQ=;
 b=xB+yOUMH1+HqPIVwYA3f+1KohCCBUZKzi2se4L7bK+0Hs0L2ST4OcrzccxNLIKZSZL
 meF2am7U3/daqiwqZ2iYjulCYMVLvp6cA+U2CEevmBa4//Ar02kR0gI8SOaoXc2FPtNM
 4mii9R/d783fyE/dxumDzGZA8y7IOZs1u0FLd3Z4kzBmSygQEGxTGUYOe5fqlT9fjxx2
 FBivVrn9YMs6qKmDf7fYx4XhyXb2rq9Zz7yxrlKls/r0+mqTuKY6553nH6pjvXf0vhDz
 dxEhqGpoCEOSpWjK878ms0OPbBVieYrKP3NYoCNhXJO1KEiCzbAQp4gwPxSiLHMZGPv/
 8yrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VM4sr45eMsFNfm3I8AuewKPZ2mzCi8kc40UVw+7O2LQ=;
 b=W1BzKJ53O8LiBuTmtCi0JcL4BKdlWOJwCk3+XhEI2/qrMoaH+LdSE2pU+4/s5+/hId
 8i0iG2pgtha5MHWnUDG/XADj/vbC01CFvAsCARDC1YvUlFGU2IxGcZoSZQkSxbS2Vs47
 K4r+XafmPx10aWtrwv959TnOrjoKrDfYtWi+bFXiwF/nm9pf8OS+3zCvE3Xy0Ibfn2dX
 DceT8oehGHy6+H+4zf2Q9TAukDit7bjqdZ1YsgpDLXd3pbR97ks+IDmWw9sOLQDYIjlY
 qE72nZnxgcEGF1M2TQpvKHFQIrP2OT5/2jF2ahQLRZlWZXGzpTNau1EL5kJMFSAMj2QJ
 /AAQ==
X-Gm-Message-State: APjAAAVeeSQwUstWnrMyAEoYJCRwuF5HncQzwSnJ4yOZmj4z6Iy8UU53
 Gz3cE/sJ6wbu9CeZc3iOxWR/mg==
X-Google-Smtp-Source: APXvYqw7OaMmOiCFpqSYiEkkioeWfbwcKs6q33Y3t8Kyrhd1NgY0z99Vh6YZxCeeeslYOpZSiSCuUQ==
X-Received: by 2002:a7b:c0d9:: with SMTP id s25mr21509184wmh.98.1581943237117; 
 Mon, 17 Feb 2020 04:40:37 -0800 (PST)
Received: from myrica ([2001:171b:2276:930:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id d16sm917782wrg.27.2020.02.17.04.40.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2020 04:40:36 -0800 (PST)
Date: Mon, 17 Feb 2020 13:40:28 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 03/11] PCI: OF: Check whether the host bridge supports ATS
Message-ID: <20200217124028.GC1650092@myrica>
References: <20200213165049.508908-1-jean-philippe@linaro.org>
 <20200213165049.508908-4-jean-philippe@linaro.org>
 <CAL_JsqKZP9u7bFsVT=5TzqmnHWm_bvH39ffkbN3q9-k32ynVig@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_JsqKZP9u7bFsVT=5TzqmnHWm_bvH39ffkbN3q9-k32ynVig@mail.gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 PCI <linux-pci@vger.kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Hanjun Guo <guohanjun@huawei.com>, Frank Rowand <frowand.list@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, Will Deacon <will@kernel.org>,
 linux-acpi@vger.kernel.org, Len Brown <lenb@kernel.org>,
 devicetree@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, David Woodhouse <dwmw2@infradead.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Linux IOMMU <iommu@lists.linux-foundation.org>,
 Sudeep Holla <sudeep.holla@arm.com>, Robin Murphy <robin.murphy@arm.com>,
 Andrew Murray <amurray@thegoodpenguin.co.uk>
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

On Thu, Feb 13, 2020 at 12:26:46PM -0600, Rob Herring wrote:
> On Thu, Feb 13, 2020 at 10:52 AM Jean-Philippe Brucker
> <jean-philippe@linaro.org> wrote:
> >
> > Copy the ats-supported flag into the pci_host_bridge structure.
> >
> > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > ---
> >  drivers/pci/controller/pci-host-common.c | 1 +
> >  drivers/pci/of.c                         | 9 +++++++++
> >  include/linux/of_pci.h                   | 3 +++
> >  3 files changed, 13 insertions(+)
> >
> > diff --git a/drivers/pci/controller/pci-host-common.c b/drivers/pci/controller/pci-host-common.c
> > index 250a3fc80ec6..a6ac927be291 100644
> > --- a/drivers/pci/controller/pci-host-common.c
> > +++ b/drivers/pci/controller/pci-host-common.c
> > @@ -92,6 +92,7 @@ int pci_host_common_probe(struct platform_device *pdev,
> >                 return ret;
> >         }
> >
> > +       of_pci_host_check_ats(bridge);
> >         platform_set_drvdata(pdev, bridge->bus);
> >         return 0;
> >  }
> > diff --git a/drivers/pci/of.c b/drivers/pci/of.c
> > index 81ceeaa6f1d5..4b8a877f1e9f 100644
> > --- a/drivers/pci/of.c
> > +++ b/drivers/pci/of.c
> > @@ -576,6 +576,15 @@ int pci_parse_request_of_pci_ranges(struct device *dev,
> >  }
> >  EXPORT_SYMBOL_GPL(pci_parse_request_of_pci_ranges);
> >
> > +void of_pci_host_check_ats(struct pci_host_bridge *bridge)
> > +{
> > +       struct device_node *np = bridge->bus->dev.of_node;
> > +
> > +       if (!np)
> > +               return;
> > +
> > +       bridge->ats_supported = of_property_read_bool(np, "ats-supported");
> > +}
> 
> Not really any point in a common function if we expect this to be only
> for ECAM hosts which it seems to be based on the binding.

I'll move this to pci-host-common.c

Thanks,
Jean
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
