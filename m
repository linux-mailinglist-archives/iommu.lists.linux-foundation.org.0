Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBC12A4743
	for <lists.iommu@lfdr.de>; Tue,  3 Nov 2020 15:06:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 07E20861AF;
	Tue,  3 Nov 2020 14:06:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9LieLNulb2Xe; Tue,  3 Nov 2020 14:06:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 99C97861E3;
	Tue,  3 Nov 2020 14:06:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7E2FFC0051;
	Tue,  3 Nov 2020 14:06:53 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C895EC0051
 for <iommu@lists.linux-foundation.org>; Tue,  3 Nov 2020 14:06:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B6B8B86C5A
 for <iommu@lists.linux-foundation.org>; Tue,  3 Nov 2020 14:06:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ibBl2xj9PYfu for <iommu@lists.linux-foundation.org>;
 Tue,  3 Nov 2020 14:06:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 9497186C4D
 for <iommu@lists.linux-foundation.org>; Tue,  3 Nov 2020 14:06:49 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5fa163fc0002>; Tue, 03 Nov 2020 06:06:52 -0800
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 3 Nov
 2020 14:06:45 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by HQMAIL101.nvidia.com (172.20.187.10) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Tue, 3 Nov 2020 14:06:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m4UxEn+/fHQtpvT5H+TAhf3DpIjB/7o3zw5WURYNYQozMACb9Z8ihV59kHEyacwXG/90M1sdS4tvb3sNoyKWyZ1g79YOCdmGfCpj9u9759QBXOsHRaf3S6Hj6egsjwu/sUw/d+b8U44CvCjYNsqYUgDmJY2qA1nhcf9dwZmy9/tg6dgAY8THBb8Vj3NBAbgWb8pA7W5vicmocd6u6Bw2Zju7b9SHYMUvum2uswI+fyub1grjnow7l9+6yOM6gZRGZa8i1pnsAmYjRsEmT7K5uQ6pD/0u5939zAUaofB/Frg+Yqs/n0hw1ChS7QQ7q0NwMuqU35rd2iSo1yAVWii4zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tLIrEYoCMgNKeogVNQHUSSTMtD3XOjJCaLnrinaavuY=;
 b=mZZ0F8fdRUpSsxXyWE+Yql0pMVeg5n1RKzzbVMoCB6IdB0Pb1r+qUIX1zzcSiaHP5nDUabevCWey8Ys/ttqAF++PlhpzzwXNN7jxGuKVSZ2OduxcHK5HzUhcTYO9+XmJ1t5VAERV7McDEiSTXs+HoM77T4nH2aHEQ7tsEWI0D2KTW2Um94XGFq8LH7BjPJUOCoCxGb6bYOesgqQYG+q08Ayfh7UY2MJOzJPSWWIKxmWvF1KwAZDNaS7H91qNf0BOQvJAxTdocePUB6Bs6+EZPcU9wOHoKVNA9R2NLUfALMbJNjStpI3+TO3P0Cf0mdaHBP1PdjfmiD+7h9oLzg7n2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from BY5PR12MB3827.namprd12.prod.outlook.com (2603:10b6:a03:1ab::16)
 by BYAPR12MB3047.namprd12.prod.outlook.com (2603:10b6:a03:d9::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.29; Tue, 3 Nov
 2020 14:06:44 +0000
Received: from BY5PR12MB3827.namprd12.prod.outlook.com
 ([fe80::2459:e095:ac09:34e5]) by BY5PR12MB3827.namprd12.prod.outlook.com
 ([fe80::2459:e095:ac09:34e5%6]) with mapi id 15.20.3499.031; Tue, 3 Nov 2020
 14:06:44 +0000
Date: Tue, 3 Nov 2020 10:06:42 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: "joro@8bytes.org" <joro@8bytes.org>
Subject: Re: (proposal) RE: [PATCH v7 00/16] vfio: expose virtual Shared
 Virtual Addressing to VMs
Message-ID: <20201103140642.GQ2620339@nvidia.com>
References: <MWHPR11MB1645CFB0C594933E92A844AC8C070@MWHPR11MB1645.namprd11.prod.outlook.com>
 <20201103095208.GA22888@8bytes.org> <20201103125643.GN2620339@nvidia.com>
 <20201103131852.GE22888@8bytes.org> <20201103132335.GO2620339@nvidia.com>
 <20201103140318.GL22888@8bytes.org>
Content-Disposition: inline
In-Reply-To: <20201103140318.GL22888@8bytes.org>
X-ClientProxiedBy: BL0PR02CA0006.namprd02.prod.outlook.com
 (2603:10b6:207:3c::19) To BY5PR12MB3827.namprd12.prod.outlook.com
 (2603:10b6:a03:1ab::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (156.34.48.30) by
 BL0PR02CA0006.namprd02.prod.outlook.com (2603:10b6:207:3c::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.18 via Frontend Transport; Tue, 3 Nov 2020 14:06:44 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1kZwxO-00Fuj7-FU; Tue, 03 Nov 2020 10:06:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1604412412; bh=tLIrEYoCMgNKeogVNQHUSSTMtD3XOjJCaLnrinaavuY=;
 h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:Date:
 From:To:CC:Subject:Message-ID:References:Content-Type:
 Content-Disposition:In-Reply-To:X-ClientProxiedBy:MIME-Version:
 X-MS-Exchange-MessageSentRepresentingType;
 b=nU+/k4+R/klPpRJlMpPJUBzeKasLIzMsSfN9rPXsFszw26/2iJ7PyE10UtIL72wgt
 +0T81QWYw2HPLe/+rfr9T+YvW03zAMYk+2ytghpHdBtaiUllBkwkGVXmvC0F/Tlz0i
 nMXuYTj3hc5Vpj0pAnlS40Ky992BFIsJ8qISfxCUwHtA660JeUAf5Rm3uPuTVqmnwO
 hOEft0q79WNdjx+xTe4qmSF+9EceFeT3gJbcWzJ8jmWRGiSurL2LD/Qm8dwbbAa/mp
 ZJg9+UAmvo7JMrRTe9UOLZJU/cy2tCtwitCpjcatQ63uZFNw5ZL3fMcUDKyAbNluy1
 4lkqvgkbHVQBA==
Cc: "jean-philippe@linaro.org" <jean-philippe@linaro.org>, "Tian,
 Kevin" <kevin.tian@intel.com>, "Raj, Ashok" <ashok.raj@intel.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "stefanha@gmail.com" <stefanha@gmail.com>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, "Sun, Yi Y" <yi.y.sun@intel.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>, "Wu,
 Hao" <hao.wu@intel.com>, "Tian, Jun J" <jun.j.tian@intel.com>
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

On Tue, Nov 03, 2020 at 03:03:18PM +0100, joro@8bytes.org wrote:
> On Tue, Nov 03, 2020 at 09:23:35AM -0400, Jason Gunthorpe wrote:
> > Userspace needs fine grained control over the composition of the page
> > table behind the PASID, 1:1 with the mm_struct is only one use case.
> 
> VFIO already offers an interface for that. It shouldn't be too
> complicated to expand that for PASID-bound page-tables.
> 
> > Userspace needs to be able to handle IOMMU faults, apparently
> 
> Could be implemented by a fault-fd handed out by VFIO.

The point is that other places beyond VFIO need this

> I really don't think that user-space should have to deal with details
> like PASIDs or other IOMMU internals, unless absolutly necessary. This
> is an OS we work on, and the idea behind an OS is to abstract the
> hardware away.

Sure, but sometimes it is necessary, and in those cases the answer
can't be "rewrite a SVA driver to use vfio"

Jason
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
