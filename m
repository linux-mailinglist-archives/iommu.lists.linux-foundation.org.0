Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id CD43F143520
	for <lists.iommu@lfdr.de>; Tue, 21 Jan 2020 02:22:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7B42987818;
	Tue, 21 Jan 2020 01:22:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Umfh3R4IF7qn; Tue, 21 Jan 2020 01:22:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 11538877FF;
	Tue, 21 Jan 2020 01:22:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EA034C1D88;
	Tue, 21 Jan 2020 01:22:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 46E25C0174
 for <iommu@lists.linux-foundation.org>; Tue, 21 Jan 2020 01:22:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 35CB187816
 for <iommu@lists.linux-foundation.org>; Tue, 21 Jan 2020 01:22:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gux1ElM5X-h1 for <iommu@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 01:22:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by hemlock.osuosl.org (Postfix) with ESMTPS id EC433877FF
 for <iommu@lists.linux-foundation.org>; Tue, 21 Jan 2020 01:22:49 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Jan 2020 17:22:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,344,1574150400"; d="scan'208";a="258879504"
Received: from orsmsx108.amr.corp.intel.com ([10.22.240.6])
 by fmsmga002.fm.intel.com with ESMTP; 20 Jan 2020 17:22:48 -0800
Received: from orsmsx124.amr.corp.intel.com (10.22.240.120) by
 ORSMSX108.amr.corp.intel.com (10.22.240.6) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 20 Jan 2020 17:22:48 -0800
Received: from orsmsx101.amr.corp.intel.com ([169.254.8.100]) by
 ORSMSX124.amr.corp.intel.com ([169.254.2.73]) with mapi id 14.03.0439.000;
 Mon, 20 Jan 2020 17:22:48 -0800
From: "Derrick, Jonathan" <jonathan.derrick@intel.com>
To: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>,
 "baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>, "helgaas@kernel.org"
 <helgaas@kernel.org>
Subject: Re: [PATCH v4 4/7] iommu/vt-d: Use pci_real_dma_dev() for mapping
Thread-Topic: [PATCH v4 4/7] iommu/vt-d: Use pci_real_dma_dev() for mapping
Thread-Index: AQHVzYW+pdAk+HzEA0yLYDZroXu/j6f02RUAgAAEjgA=
Date: Tue, 21 Jan 2020 01:22:47 +0000
Message-ID: <8fcd8782dfdfb567e7399b78f552658f9cd9f5b1.camel@intel.com>
References: <1579278449-174098-1-git-send-email-jonathan.derrick@intel.com>
 <1579278449-174098-5-git-send-email-jonathan.derrick@intel.com>
 <88149be1-1e5d-f0d2-ba5d-6e979014f11e@linux.intel.com>
In-Reply-To: <88149be1-1e5d-f0d2-ba5d-6e979014f11e@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.255.4.198]
Content-ID: <6FA405CEA6002A41BE5DF60303D78A23@intel.com>
MIME-Version: 1.0
Cc: "kbusch@kernel.org" <kbusch@kernel.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>, "hch@lst.de" <hch@lst.de>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>
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

Good catch. Thanks Baolu.
Will do v5 fixing this and Christoph's nit

On Tue, 2020-01-21 at 09:06 +0800, Lu Baolu wrote:
> Hi,
> 
> On 1/18/20 12:27 AM, Jon Derrick wrote:
> > The PCI device may have a DMA requester on another bus, such as VMD
> > subdevices needing to use the VMD endpoint. This case requires the real
> > DMA device when mapping to IOMMU.
> > 
> > Signed-off-by: Jon Derrick<jonathan.derrick@intel.com>
> > ---
> >   drivers/iommu/intel-iommu.c | 9 +++++++++
> >   1 file changed, 9 insertions(+)
> > 
> > diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
> > index 0c8d81f..01a1b0f 100644
> > --- a/drivers/iommu/intel-iommu.c
> > +++ b/drivers/iommu/intel-iommu.c
> > @@ -782,6 +782,8 @@ static struct intel_iommu *device_to_iommu(struct device *dev, u8 *bus, u8 *devf
> >   			return NULL;
> >   #endif
> >   
> > +		pdev = pci_real_dma_dev(dev);
> 
> This isn't correct. It will result in a compiling error when bisect.
> 
> Best regards,
> baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
