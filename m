Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FF429552C
	for <lists.iommu@lfdr.de>; Thu, 22 Oct 2020 01:32:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 782F986B2A;
	Wed, 21 Oct 2020 23:32:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ezs8Nf3PSXD4; Wed, 21 Oct 2020 23:32:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6EEFF86A1D;
	Wed, 21 Oct 2020 23:32:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5F999C0051;
	Wed, 21 Oct 2020 23:32:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A610BC0051
 for <iommu@lists.linux-foundation.org>; Wed, 21 Oct 2020 23:32:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 875C587387
 for <iommu@lists.linux-foundation.org>; Wed, 21 Oct 2020 23:32:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mM94IO0466dy for <iommu@lists.linux-foundation.org>;
 Wed, 21 Oct 2020 23:32:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from nat-hk.nvidia.com (nat-hk.nvidia.com [203.18.50.4])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 0CE848738F
 for <iommu@lists.linux-foundation.org>; Wed, 21 Oct 2020 23:32:25 +0000 (UTC)
Received: from HKMAIL104.nvidia.com (Not Verified[10.18.92.9]) by
 nat-hk.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f90c5070000>; Thu, 22 Oct 2020 07:32:23 +0800
Received: from HKMAIL103.nvidia.com (10.18.16.12) by HKMAIL104.nvidia.com
 (10.18.16.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 21 Oct
 2020 23:32:22 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by HKMAIL103.nvidia.com (10.18.16.12) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Wed, 21 Oct 2020 23:32:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bv9vUGzXW075GI9DmBUCc5wi8ALjnRedTgX5yMwkVm0DnYidY2xgw5S7e7DtqPwWcIylBeZ2EdG7lX2LWKm8/eVpLkzv73oQs5j2hG9LY5I8MLz6m9ZM0XwiwZ3kNk2zWZXgAdkYEymPzOq/+wxK7/5ldXtFeB2DYitzrgFUtkNM9ky9eI1kllOPg4t5nf4+hRkzlpocoIZ5oy/2S4h1diOHugYkktra5r3EX70LhQ86vuSlRpxSZNVLo0qbSCLe1taNVzqu6lxhUVSEOQzw/xzrzZTotV4WB0guEJu7/a6d10/R2DgvJYSgAwDh8g0Q2I8tScFwAvPitmgJyMP3mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9EhA+QL2tIBfp+kCC/XppT3SJ10Pns+uAIVnn7kCN6w=;
 b=JACUCAs7DnbXjO6aEz/iLS96fC0HY8yydBM5zy7DrGAq2QC1qQcboEoraQV2Q+bpDICz0UITzaLOb8ITKI2+9vQ0WAuoK2UX46S0bFSAkg88kkHKMFp9UMVuIM1jEfSMvperNvHBQZINvB0e2O999BZg0GPpPsf5E4vfzfkDUjUB1zqDuKxHPqpVVquOZnw+eMMmbKoOIhaeCm8j3Gmw/Hj634TFhwx6Y3Ysr6vBNMPVWGppantHS1YKxOcbTBeVpkrBn1g6jv3WQEgIPDgQT7s8J1JUazAI3bHgKmXfsY91xzJmbu1ghOdtSR5EWcXN9Vdh66UQ06Clu0tjVq1Deg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB4041.namprd12.prod.outlook.com (2603:10b6:5:210::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Wed, 21 Oct
 2020 23:32:20 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::cdbe:f274:ad65:9a78]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::cdbe:f274:ad65:9a78%7]) with mapi id 15.20.3477.028; Wed, 21 Oct 2020
 23:32:19 +0000
Date: Wed, 21 Oct 2020 20:32:18 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Raj, Ashok" <ashok.raj@intel.com>
Subject: Re: (proposal) RE: [PATCH v7 00/16] vfio: expose virtual Shared
 Virtual Addressing to VMs
Message-ID: <20201021233218.GV6219@nvidia.com>
References: <20201020170336.GK6219@nvidia.com>
 <20201020195146.GA86371@otc-nc-03> <20201020195557.GO6219@nvidia.com>
 <20201020200844.GC86371@otc-nc-03> <20201020201403.GP6219@nvidia.com>
 <20201020202713.GF86371@otc-nc-03> <20201021114829.GR6219@nvidia.com>
 <20201021175146.GA92867@otc-nc-03> <20201021182442.GU6219@nvidia.com>
 <20201021200315.GA93724@otc-nc-03>
Content-Disposition: inline
In-Reply-To: <20201021200315.GA93724@otc-nc-03>
X-ClientProxiedBy: MN2PR15CA0005.namprd15.prod.outlook.com
 (2603:10b6:208:1b4::18) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (156.34.48.30) by
 MN2PR15CA0005.namprd15.prod.outlook.com (2603:10b6:208:1b4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Wed, 21 Oct 2020 23:32:19 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1kVNac-003kLj-7K; Wed, 21 Oct 2020 20:32:18 -0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1603323143; bh=9EhA+QL2tIBfp+kCC/XppT3SJ10Pns+uAIVnn7kCN6w=;
 h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:Date:
 From:To:CC:Subject:Message-ID:References:Content-Type:
 Content-Disposition:In-Reply-To:X-ClientProxiedBy:MIME-Version:
 X-MS-Exchange-MessageSentRepresentingType;
 b=MvOxGEgZ0dkh6aDDYt9AWkDFrxu5vuWyS3LrEvXqbwj89YZhFPsMK2J9N/+XifUOe
 EuCpZ11rxIeKLc4HaTS0oBEYkIxnItNgy3f4ke7TvcAyLSLk4K1fYPpoZa62KXhE18
 mSw/0tyJ7Zjk01fDu5M2gpGZ4M1lDWI2EmrMvpJp3LC+77tQqGLJ+Zt7xjG/Y+voR7
 Y6azWfKi7Ttp35GQYMAMv7cw43NsDVUPFnCA6XTkqhH/JGGLP5J780k7GMQJNXh6xX
 mYCYp1JkF4exOPYjMjSuuNFWh0BncJDOMXKBOffSAbvwAMDW/wzPozbw0YZJ/4T50O
 QwSRFAO2G0+tQ==
Cc: "Tian, Jun J" <jun.j.tian@intel.com>, "Tian, Kevin" <kevin.tian@intel.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
 "stefanha@gmail.com" <stefanha@gmail.com>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, "Sun, Yi Y" <yi.y.sun@intel.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>, "Zhu,
 Lingshan" <lingshan.zhu@intel.com>, "Wu, Hao" <hao.wu@intel.com>
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

On Wed, Oct 21, 2020 at 01:03:15PM -0700, Raj, Ashok wrote:

> I'm not sure why you tie in IDXD and VDPA here. How IDXD uses native
> SVM is orthogonal to how we achieve mdev passthrough to guest and
> vSVM.

Everyone assumes that vIOMMU and SIOV aka PASID is going to be needed
on the VDPA side as well, I think that is why JasonW brought this up
in the first place.

We may not see vSVA for VDPA, but that seems like some special sub
mode of all the other vIOMMU and PASID stuff, and not a completely
distinct thing.

Jason
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
