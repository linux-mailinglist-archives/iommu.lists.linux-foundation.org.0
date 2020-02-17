Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id ED11316165C
	for <lists.iommu@lfdr.de>; Mon, 17 Feb 2020 16:40:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A5D7D86F85;
	Mon, 17 Feb 2020 15:40:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 300biodX8sFq; Mon, 17 Feb 2020 15:40:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0CF0186F58;
	Mon, 17 Feb 2020 15:40:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E8F01C013E;
	Mon, 17 Feb 2020 15:40:25 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E5FF0C013E
 for <iommu@lists.linux-foundation.org>; Mon, 17 Feb 2020 15:40:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D40E120030
 for <iommu@lists.linux-foundation.org>; Mon, 17 Feb 2020 15:40:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yQOV6wo9YUKU for <iommu@lists.linux-foundation.org>;
 Mon, 17 Feb 2020 15:40:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by silver.osuosl.org (Postfix) with ESMTPS id 923581FFFF
 for <iommu@lists.linux-foundation.org>; Mon, 17 Feb 2020 15:40:23 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id z3so20331258wru.3
 for <iommu@lists.linux-foundation.org>; Mon, 17 Feb 2020 07:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=uBL44HTwPsTzK1hTlXHwrWPFvRz4I8cxeuhUA7nfr3s=;
 b=QUNDlRjh2O+ooQ41KWBChztMd4j9tV2M8HiE6TDGhh6KZcCXQYdQmMqHkRy/oPre/d
 E+T64sT8TUAqvGZCkZWcpAPXMK/psI/SMbqtUXH8WD/97O+XqMwt7rE0VgfYpg4SGCTu
 72DvsxmGQ2FHB1KOF86wT5RUdwe9l5E14uXBkwlKILpzWF5nOlDot/mlGYQpzffkiZng
 dV1PcmwTrlY7TdA4Y7kgPv5XUqhxhLqt6oG02ccYRx64/bgjYrAaemMkV8MHRgYP/RlA
 RNsfj1wDY4F+M6s4FATLU+2N+UfYeGwZGxIXM15btV8V9U0AnPqJn9J60Be6mPZjxKkb
 OLhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uBL44HTwPsTzK1hTlXHwrWPFvRz4I8cxeuhUA7nfr3s=;
 b=CfVE9QzTt4lA/EObR1JgTySWaWs7GTLM/WdDyppGJEZo22NgAZHLCZ5OvKVTXRV+jd
 br5cCpaF0QY0em0km5pz2VTbs6IXn+WWp2DLYM1V80SSUYBl3CnG8ZkiLjlw7pCLBAyK
 Y7v5mBGxV+4lsND121fX2iHNqNnTliZNKlohWZKW64lt2BVGhFbquGfxaujyy1HV16RW
 hMAvIfmziw+APPv1iY5/7hOfxKFOokPijKe37zNRyYSPKu2pdja3OFesVOc7SXLoVRwY
 R4aBSzvRO6vJF4VMoUQB/CCe+9YSKfSCt0SUWfhygvMctHGB0kxrpH5HVy12M60etUeH
 scQg==
X-Gm-Message-State: APjAAAWeOtUgwElTJC+7Qsc83AUzQaSDfa5WoWHvUofKl10Gbac5i0By
 h4CepHbFIu/qB+N81De0XBlTOQ==
X-Google-Smtp-Source: APXvYqyK3wvWFPYLO6Oneazyxhd5g+tje1jkIBunochJVdUjHRcEMjjKDjk9tOFHPoHKB9Cr5dnXww==
X-Received: by 2002:adf:f109:: with SMTP id r9mr22236398wro.406.1581954021861; 
 Mon, 17 Feb 2020 07:40:21 -0800 (PST)
Received: from myrica ([2001:171b:2276:930:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id v131sm1106010wme.23.2020.02.17.07.40.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2020 07:40:21 -0800 (PST)
Date: Mon, 17 Feb 2020 16:40:12 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH 02/11] PCI: Add ats_supported host bridge flag
Message-ID: <20200217154012.GD1650092@myrica>
References: <20200213165049.508908-3-jean-philippe@linaro.org>
 <20200215211047.GA124796@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200215211047.GA124796@google.com>
Cc: mark.rutland@arm.com, linux-doc@vger.kernel.org, linux-pci@vger.kernel.org,
 liviu.dudau@arm.com, guohanjun@huawei.com, frowand.list@gmail.com,
 corbet@lwn.net, will@kernel.org, linux-acpi@vger.kernel.org, lenb@kernel.org,
 devicetree@vger.kernel.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, dwmw2@infradead.org, rjw@rjwysocki.net,
 iommu@lists.linux-foundation.org, sudeep.holla@arm.com, robin.murphy@arm.com,
 amurray@thegoodpenguin.co.uk
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

On Sat, Feb 15, 2020 at 03:10:47PM -0600, Bjorn Helgaas wrote:
> On Thu, Feb 13, 2020 at 05:50:40PM +0100, Jean-Philippe Brucker wrote:
> > Each vendor has their own way of describing whether a host bridge
> > supports ATS.  The Intel and AMD ACPI tables selectively enable or
> > disable ATS per device or sub-tree, while Arm has a single bit for each
> > host bridge.  For those that need it, add an ats_supported bit to the
> > host bridge structure.
> > 
> > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > ---
> >  drivers/pci/probe.c | 7 +++++++
> >  include/linux/pci.h | 1 +
> >  2 files changed, 8 insertions(+)
> > 
> > diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> > index 512cb4312ddd..75c0a25af44e 100644
> > --- a/drivers/pci/probe.c
> > +++ b/drivers/pci/probe.c
> > @@ -598,6 +598,13 @@ static void pci_init_host_bridge(struct pci_host_bridge *bridge)
> >  	bridge->native_shpc_hotplug = 1;
> >  	bridge->native_pme = 1;
> >  	bridge->native_ltr = 1;
> > +
> > +	/*
> > +	 * Some systems may disable ATS at the host bridge (ACPI IORT,
> > +	 * device-tree), other filter it with a smaller granularity (ACPI DMAR
> > +	 * and IVRS).
> > +	 */
> > +	bridge->ats_supported = 1;
> 
> The cover letter says it's important to enable ATS only if the host
> bridge supports it.  From the other patches, it looks like we learn if
> the host bridge supports ATS from either a DT "ats-supported" property
> or an ACPI IORT table.  If that's the case, shouldn't the default here
> be "ATS is *not* supported"?

The ACPI IVRS table (AMD) doesn't have a property for the host bridge, it
can only deselect ATS for a sub-range of devices. Similarly the DMAR table
(Intel) declares that ATS is supported either by the whole PCIe domain or
for sub-ranges of devices. I selected ats_supported at the bridge by
default since IVRS needs it and DMAR has its own fine-grained ATS support
configuration.

I'm still not sure this is the right approach, given that the
ats_supported bridge property doesn't exactly correspond to a firmware
property on all platforms. Maybe the device-tree implementation should
follow the IORT one where each device carries a fwspec property stating
"root-complex supports ATS". But it isn't nice either so I tried a cleaner
implementation (as discussed with Robin back on the ATS-with-SMMUv3 series
[1]).

Thanks,
Jean

[1] https://lore.kernel.org/linux-iommu/c10c7adb-c7f6-f8c6-05cc-f4f143427a2d@arm.com/
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
