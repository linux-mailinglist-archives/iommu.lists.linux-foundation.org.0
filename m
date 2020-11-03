Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 740F22A4D79
	for <lists.iommu@lfdr.de>; Tue,  3 Nov 2020 18:49:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 38CB887450;
	Tue,  3 Nov 2020 17:49:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AV8iKlCXGPR0; Tue,  3 Nov 2020 17:49:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B8D8687455;
	Tue,  3 Nov 2020 17:49:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A2BE2C0051;
	Tue,  3 Nov 2020 17:49:03 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D9BE6C0051
 for <iommu@lists.linux-foundation.org>; Tue,  3 Nov 2020 17:49:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C829486322
 for <iommu@lists.linux-foundation.org>; Tue,  3 Nov 2020 17:49:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CJ4H8xVJJHN1 for <iommu@lists.linux-foundation.org>;
 Tue,  3 Nov 2020 17:49:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from nat-hk.nvidia.com (nat-hk.nvidia.com [203.18.50.4])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 0276F86CEC
 for <iommu@lists.linux-foundation.org>; Tue,  3 Nov 2020 17:49:00 +0000 (UTC)
Received: from HKMAIL102.nvidia.com (Not Verified[10.18.92.77]) by
 nat-hk.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5fa1980a0000>; Wed, 04 Nov 2020 01:48:58 +0800
Received: from HKMAIL101.nvidia.com (10.18.16.10) by HKMAIL102.nvidia.com
 (10.18.16.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 3 Nov
 2020 17:48:55 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by HKMAIL101.nvidia.com (10.18.16.10) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Tue, 3 Nov 2020 17:48:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EDxYyRy1xQoari4+JpC7Es1rNHQepteCOXVGYt7jOFQh/bIp3QZOh9wJcQF5cHkarBbRAtZ9J2jS4BTq1QR79bAeZE61Jbs0xV5WPNyhKsLaIFS7CkY3edIaWMMJjNZsWhnr+/vri3a5fMgNut5HsD6ee63CgDaKwfSRh7p5NJTt/ZWNVs6PJq31EemsEQ6U822d8wWSMgnazwmPHyeEr11GtrBOep8OgefLtIfHJsEdDVQCudgMyO7M8UqnnO0bclrp9oWdf6sslcKW4rHRQ1l8siTUeWhVuk+Ombq9NZOxWnLr1odYFv+0hqqSam1QGZZfyCZ37l8EgllivnKDrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sC2uAbdTvs/K1qkr9fwuV7dMmG1zUKG3QNxmdiVhw4E=;
 b=Q2SvuRIbC/sk7aMPV1CX4Jpno3+tJ6IxUeawORBnrSXzNyz2C8gPMbrEIGK4Fhtij6uV88WYnWuJlKTK3XwLJDHoPIG9N5jBsvPtAlblu3kr2UB1/YIpOj2EwVK8GbnTCjFhn7dgPhBNU7zAunhI/IIaKi2E+aQKTfPzQ/rccj9ZwERLdh/8UQWmbH0fCaV+W+aRpWWuyNqqeatVvN6CzyH+QMpbUsnBcwcYU16zGt26ozTHEcvNNm3ixPQy+xE2HPchZud2ePpvIrRaG1YJ+bkZjQSefPlX6hixun8c3VpLoU/yAG6TgqjpXW99uHZM7lBK4i2QfUxenTMwZ5Y0yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from BY5PR12MB3827.namprd12.prod.outlook.com (2603:10b6:a03:1ab::16)
 by BY5PR12MB4098.namprd12.prod.outlook.com (2603:10b6:a03:205::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19; Tue, 3 Nov
 2020 17:48:53 +0000
Received: from BY5PR12MB3827.namprd12.prod.outlook.com
 ([fe80::2459:e095:ac09:34e5]) by BY5PR12MB3827.namprd12.prod.outlook.com
 ([fe80::2459:e095:ac09:34e5%6]) with mapi id 15.20.3499.031; Tue, 3 Nov 2020
 17:48:53 +0000
Date: Tue, 3 Nov 2020 13:48:51 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: "joro@8bytes.org" <joro@8bytes.org>
Subject: Re: (proposal) RE: [PATCH v7 00/16] vfio: expose virtual Shared
 Virtual Addressing to VMs
Message-ID: <20201103174851.GS2620339@nvidia.com>
References: <MWHPR11MB1645CFB0C594933E92A844AC8C070@MWHPR11MB1645.namprd11.prod.outlook.com>
 <20201103095208.GA22888@8bytes.org> <20201103125643.GN2620339@nvidia.com>
 <20201103131852.GE22888@8bytes.org> <20201103132335.GO2620339@nvidia.com>
 <20201103140318.GL22888@8bytes.org> <20201103140642.GQ2620339@nvidia.com>
 <20201103143532.GM22888@8bytes.org> <20201103152223.GR2620339@nvidia.com>
 <20201103165539.GN22888@8bytes.org>
Content-Disposition: inline
In-Reply-To: <20201103165539.GN22888@8bytes.org>
X-ClientProxiedBy: MN2PR16CA0006.namprd16.prod.outlook.com
 (2603:10b6:208:134::19) To BY5PR12MB3827.namprd12.prod.outlook.com
 (2603:10b6:a03:1ab::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (156.34.48.30) by
 MN2PR16CA0006.namprd16.prod.outlook.com (2603:10b6:208:134::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Tue, 3 Nov 2020 17:48:53 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1ka0QN-00G6Wc-73; Tue, 03 Nov 2020 13:48:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1604425738; bh=sC2uAbdTvs/K1qkr9fwuV7dMmG1zUKG3QNxmdiVhw4E=;
 h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:Date:
 From:To:CC:Subject:Message-ID:References:Content-Type:
 Content-Disposition:In-Reply-To:X-ClientProxiedBy:MIME-Version:
 X-MS-Exchange-MessageSentRepresentingType;
 b=LthxrhC1u4BG882dpQRLR0ro9hpDbqjHGU+44m6O4ZXSar//CnwosFFp7Eoxfohhg
 uJgpXlRPdHl7CLVCm00D3eFfoihx7ipEq6ZjCX9Kx8Cg5NTzD+2N+sHXGZzDqJKOy9
 mtYpjGF87trFgIozURvvaePlX7e3c3S4dcJ0bULaIl0E3y5GMTNMIhX6zfE7Oqz0wd
 oeorO9diTV/eTDPGxdrKrnXehmKQtqWvvGfnRAfAEGJ7dQTDfypCJVyZNuDX9P3z+y
 gTFUacpwdglv9TdMlMbNFEeXa2n5s8eyiJZNprbQ+Dm8FXAOfmYLaK0UVwaBHagDx4
 +KzNsv2u3x8eA==
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

On Tue, Nov 03, 2020 at 05:55:40PM +0100, joro@8bytes.org wrote:
> On Tue, Nov 03, 2020 at 11:22:23AM -0400, Jason Gunthorpe wrote:
> > This whole thread was brought up by IDXD which has a SVA driver and
> > now wants to add a vfio-mdev driver too. SVA devices that want to be
> > plugged into VMs are going to be common - this architecture that a SVA
> > driver cannot cover the kvm case seems problematic.
> 
> Isn't that the same pattern as having separate drivers for VFs and the
> parent device in SR-IOV?

I think the same PCI driver with a small flag to support the PF or
VF is not the same as two completely different drivers in different
subsystems

Jason
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
