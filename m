Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id A25B31793FD
	for <lists.iommu@lfdr.de>; Wed,  4 Mar 2020 16:48:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4ED3587A56;
	Wed,  4 Mar 2020 15:48:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DELKhzUBWknq; Wed,  4 Mar 2020 15:48:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 324D387AC9;
	Wed,  4 Mar 2020 15:48:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 19B97C1D8E;
	Wed,  4 Mar 2020 15:48:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B8570C013E;
 Wed,  4 Mar 2020 15:48:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 9F0042048A;
 Wed,  4 Mar 2020 15:48:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9wnKeJfmzR8s; Wed,  4 Mar 2020 15:48:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by silver.osuosl.org (Postfix) with ESMTPS id A6D542045F;
 Wed,  4 Mar 2020 15:48:30 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Mar 2020 07:48:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,514,1574150400"; d="scan'208";a="274712281"
Received: from rschneck-mobl.amr.corp.intel.com (HELO jacob-XPS-13-9365)
 ([10.251.19.94])
 by fmsmga002.fm.intel.com with ESMTP; 04 Mar 2020 07:48:29 -0800
Date: Wed, 4 Mar 2020 07:48:54 -0800
From: Jacob Pan <jacob.jun.pan@intel.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v2 1/3] iommu/virtio: Add topology description to
 virtio-iommu config space
Message-ID: <20200304074854.3ea958a1@jacob-XPS-13-9365>
In-Reply-To: <20200304133707.GB4177@8bytes.org>
References: <20200228172537.377327-1-jean-philippe@linaro.org>
 <20200228172537.377327-2-jean-philippe@linaro.org>
 <20200302161611.GD7829@8bytes.org>
 <9004f814-2f7c-9024-3465-6f9661b97b7a@redhat.com>
 <20200303130155.GA13185@8bytes.org>
 <20200303084753-mutt-send-email-mst@kernel.org>
 <20200303155318.GA3954@8bytes.org>
 <20200303105523-mutt-send-email-mst@kernel.org>
 <20200304133707.GB4177@8bytes.org>
Organization: OTC
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, kevin.tian@intel.com,
 "Michael S. Tsirkin" <mst@redhat.com>, linux-pci@vger.kernel.org,
 jasowang@redhat.com, virtualization@lists.linux-foundation.org,
 iommu@lists.linux-foundation.org, sebastien.boeuf@intel.com,
 jacob.jun.pan@intel.com, bhelgaas@google.com, robin.murphy@arm.com
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

On Wed, 4 Mar 2020 14:37:08 +0100
Joerg Roedel <joro@8bytes.org> wrote:

> Hi Michael,
> 
> On Tue, Mar 03, 2020 at 11:09:41AM -0500, Michael S. Tsirkin wrote:
> > No. It's coded into the hardware. Which might even be practical
> > for bare-metal (e.g. on-board flash), but is very practical
> > when the device is part of a hypervisor.  
> 
> If its that way on PPC, than fine for them. But since this is
> enablement for x86, it should follow the x86 platform best practices,
> and that means describing hardware through ACPI.
> 
> > This "hardware" is actually part of hypervisor so there's no
> > reason it can't be completely self-descriptive. It's specified
> > by the same entity as the "firmware".  
> 
> That is just an implementation detail. Yes, QEMU emulates the hardware
> and builds the ACPI tables. But it could also be implemented in a way
> where the ACPI tables are build by guest firmware.
> 
> > I don't see why it would be much faster. The interface isn't that
> > different from command queues of VTD.  
> 
> VirtIO IOMMU doesn't need to build page-tables that the hypervisor
> then has to shadow, which makes things much faster. If you emulate
> one of the other IOMMUs (VT-d or AMD-Vi) the code has to shadow the
> full page-table at once when device passthrough is used. VirtIO-IOMMU
> doesn't need that, and that makes it much faster and efficient.
> 
For emulated VT-d IOMMU, GIOVA can also be build as first level page
tables then pass to the host IOMMU to bind. There is no need to shadow
in this case, pIOMMU will do nested translation and walk guest page
tables.

> > Making ACPI meet the goals of embedded projects such as kata
> > containers would be a gigantic task with huge stability
> > implications.  By comparison this 400-line parser is well contained
> > and does the job.  I didn't yet see compelling reasons not to merge
> > this, but I'll be interested to see some more specific concerns.  
> 
> An ACPI table parse wouldn't need more lines of code. For embedded
> systems there is still the DT way of describing things.
> 
I thought we have the universal device properties to abstract DT and
ACPI (via _DSD). Is that an option?

> Regards,
> 
> 	Joerg
> _______________________________________________
> iommu mailing list
> iommu@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/iommu

[Jacob Pan]
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
