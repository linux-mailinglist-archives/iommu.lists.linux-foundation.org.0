Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E50135C35
	for <lists.iommu@lfdr.de>; Thu,  9 Jan 2020 16:06:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 520498651C;
	Thu,  9 Jan 2020 15:06:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 80_NNzfkgLc7; Thu,  9 Jan 2020 15:06:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C3D018648E;
	Thu,  9 Jan 2020 15:06:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B71B1C1D8B;
	Thu,  9 Jan 2020 15:06:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C35AFC0881
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jan 2020 15:06:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id BCB8B8648E
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jan 2020 15:06:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yZfXlVWuho-z for <iommu@lists.linux-foundation.org>;
 Thu,  9 Jan 2020 15:06:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 19FB9860C2
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jan 2020 15:06:19 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Jan 2020 07:06:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,414,1571727600"; d="scan'208";a="246694487"
Received: from orsmsx110.amr.corp.intel.com ([10.22.240.8])
 by fmsmga004.fm.intel.com with ESMTP; 09 Jan 2020 07:06:17 -0800
Received: from orsmsx153.amr.corp.intel.com (10.22.226.247) by
 ORSMSX110.amr.corp.intel.com (10.22.240.8) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 9 Jan 2020 07:06:17 -0800
Received: from orsmsx101.amr.corp.intel.com ([169.254.8.147]) by
 ORSMSX153.amr.corp.intel.com ([169.254.12.176]) with mapi id 14.03.0439.000;
 Thu, 9 Jan 2020 07:06:17 -0800
From: "Derrick, Jonathan" <jonathan.derrick@intel.com>
To: "hch@lst.de" <hch@lst.de>
Subject: Re: [RFC 3/5] x86/PCI: Expose VMD's device in pci_sysdata
Thread-Topic: [RFC 3/5] x86/PCI: Expose VMD's device in pci_sysdata
Thread-Index: AQHVwEr2DDGpqCrTpUazRoVkAefkIKfi+SsAgAAJAgA=
Date: Thu, 9 Jan 2020 15:06:16 +0000
Message-ID: <f2493d85ab9cf5fa2622b60c55b20aa4a5a99bcb.camel@intel.com>
References: <1577823863-3303-1-git-send-email-jonathan.derrick@intel.com>
 <1577823863-3303-4-git-send-email-jonathan.derrick@intel.com>
 <20200109143356.GB22656@lst.de>
In-Reply-To: <20200109143356.GB22656@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.255.4.146]
Content-ID: <8EE5DD1903CFAA46A047845FF7E8AC5B@intel.com>
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

On Thu, 2020-01-09 at 15:33 +0100, Christoph Hellwig wrote:
> On Tue, Dec 31, 2019 at 01:24:21PM -0700, Jon Derrick wrote:
> > To be used by intel-iommu code to find the correct domain.
> 
> Any reason to prefer this version over my patches 2 and 3 from the
> series in August?

Mine uses the correct device's dma mask
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
