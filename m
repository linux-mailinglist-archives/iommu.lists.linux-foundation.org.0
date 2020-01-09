Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEA7135C38
	for <lists.iommu@lfdr.de>; Thu,  9 Jan 2020 16:06:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 099E481B14;
	Thu,  9 Jan 2020 15:06:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mYK-aKJeYexB; Thu,  9 Jan 2020 15:06:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 162DD881F9;
	Thu,  9 Jan 2020 15:06:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F2056C0881;
	Thu,  9 Jan 2020 15:06:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 078D2C0881
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jan 2020 15:06:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E5F5E214E9
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jan 2020 15:06:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A67UrAZqyDMQ for <iommu@lists.linux-foundation.org>;
 Thu,  9 Jan 2020 15:06:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by silver.osuosl.org (Postfix) with ESMTPS id 10D6220361
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jan 2020 15:06:20 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Jan 2020 07:06:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,414,1571727600"; d="scan'208";a="396115887"
Received: from orsmsx106.amr.corp.intel.com ([10.22.225.133])
 by orsmga005.jf.intel.com with ESMTP; 09 Jan 2020 07:06:19 -0800
Received: from orsmsx101.amr.corp.intel.com ([169.254.8.147]) by
 ORSMSX106.amr.corp.intel.com ([169.254.1.81]) with mapi id 14.03.0439.000;
 Thu, 9 Jan 2020 07:06:19 -0800
From: "Derrick, Jonathan" <jonathan.derrick@intel.com>
To: "hch@lst.de" <hch@lst.de>
Subject: Re: [RFC 5/5] x86/PCI: Remove unused X86_DEV_DMA_OPS
Thread-Topic: [RFC 5/5] x86/PCI: Remove unused X86_DEV_DMA_OPS
Thread-Index: AQHVwEr3S4KIoL/nS0WrreVURfr+T6fi+gYAgAAIKoA=
Date: Thu, 9 Jan 2020 15:06:18 +0000
Message-ID: <d520cd818840894c043432109104564109f5e67a.camel@intel.com>
References: <1577823863-3303-1-git-send-email-jonathan.derrick@intel.com>
 <1577823863-3303-6-git-send-email-jonathan.derrick@intel.com>
 <20200109143700.GD22656@lst.de>
In-Reply-To: <20200109143700.GD22656@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.255.4.146]
Content-ID: <33DDD8729996C34A9B073A900E677243@intel.com>
MIME-Version: 1.0
Cc: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "helgaas@kernel.org" <helgaas@kernel.org>,
 "kbusch@kernel.org" <kbusch@kernel.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
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

On Thu, 2020-01-09 at 15:37 +0100, Christoph Hellwig wrote:
> On Tue, Dec 31, 2019 at 01:24:23PM -0700, Jon Derrick wrote:
> > VMD was the only user of device dma operations. Now that the IOMMU has
> > been made aware of direct DMA aliases, VMD domain devices can reference
> > the VMD endpoint directly and the VMD device dma operations has been
> > made obsolete.
> > 
> > Signed-off-by: Jon Derrick <jonathan.derrick@intel.com>
> 
> This seems to be a 1:1 copy of my patch from August?
Sorry I didn't notice that. I'll give you attributions.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
