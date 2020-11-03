Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id D81642A45AD
	for <lists.iommu@lfdr.de>; Tue,  3 Nov 2020 13:57:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 80F8285F87;
	Tue,  3 Nov 2020 12:57:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gD3kbMrK6Jq0; Tue,  3 Nov 2020 12:57:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8951785EAE;
	Tue,  3 Nov 2020 12:57:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 77FF1C0051;
	Tue,  3 Nov 2020 12:57:04 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 88B6AC0051
 for <iommu@lists.linux-foundation.org>; Tue,  3 Nov 2020 12:57:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6D27D86968
 for <iommu@lists.linux-foundation.org>; Tue,  3 Nov 2020 12:57:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sJbN9PPNEoKf for <iommu@lists.linux-foundation.org>;
 Tue,  3 Nov 2020 12:56:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from nat-hk.nvidia.com (nat-hk.nvidia.com [203.18.50.4])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 328A786961
 for <iommu@lists.linux-foundation.org>; Tue,  3 Nov 2020 12:56:58 +0000 (UTC)
Received: from HKMAIL104.nvidia.com (Not Verified[10.18.92.77]) by
 nat-hk.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5fa153970000>; Tue, 03 Nov 2020 20:56:55 +0800
Received: from HKMAIL102.nvidia.com (10.18.16.11) by HKMAIL104.nvidia.com
 (10.18.16.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 3 Nov
 2020 12:56:50 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 HKMAIL102.nvidia.com (10.18.16.11) with Microsoft SMTP Server (TLS)
 id 15.0.1473.3 via Frontend Transport; Tue, 3 Nov 2020 12:56:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mcr7xIv3hF33PyIxiEup+1dBKrCsJ6OxX/bXrsHQ7/VPfBkO0kk+/zqcOmtSS5LmfTalHcmYI8gN+qxXfgW7rvy1igAV2uRL3AnXsDnCn5H557yJa5nKzQcDkMyRzpS8ML9C5QE1P2n4HkBGja/P/CSZtf8JgDBL9wc+DZP0Uyl7ysCFa5ZFn7V01LfWxwCqPSCJSMRE4nqYoa7fjGMs+jH/PDpMdUBLPfXg/lM4oskLvkbQVFvRmTP51Bju0MS4N0K68IXYI1byRr64qw6yqhnbXoiyLNkC7H26JR9Y/nBleYiJexMOLw/NmjIyO5rWV5BC9tqdG3Jb6qfMNxEhiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b+pbF42oMUQw1m5KD73EvM2ZL1kG2Sbe9aC/BOgbG2Q=;
 b=FVHbteUTzx+xxbTgFQRkbb/ZM1HADj/gH5XV9e7aC++CvPXixwhHs42FQDIq4nncPEwNRptewgRpiUfjpslNbMgis1E4R0ZVqS8J+3udk/Tfxk+ZX0UxlEvcWcp/gwkNH5jx9svyeEDU9CuO9uLC86fsQQh0pnK7ajdLhLB6K61fBA8IJhRvhPGSgcUT04R3OaZDRHwocPHDssz7a2x1R/moG4bEqXrGIdD6rjZvB3cYndtAbxKKzPpgvP0loe1qdKfUhsqyqMNhr9CODx0sH38OR1/fBBLV7ILNpsBlhR3BnoPkmHaQjHObMqlzSGWG9kTj94nA23qUf5R2YBAVoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from BY5PR12MB3827.namprd12.prod.outlook.com (2603:10b6:a03:1ab::16)
 by BYAPR12MB2854.namprd12.prod.outlook.com (2603:10b6:a03:135::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Tue, 3 Nov
 2020 12:56:45 +0000
Received: from BY5PR12MB3827.namprd12.prod.outlook.com
 ([fe80::2459:e095:ac09:34e5]) by BY5PR12MB3827.namprd12.prod.outlook.com
 ([fe80::2459:e095:ac09:34e5%6]) with mapi id 15.20.3499.031; Tue, 3 Nov 2020
 12:56:45 +0000
Date: Tue, 3 Nov 2020 08:56:43 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: "joro@8bytes.org" <joro@8bytes.org>
Subject: Re: (proposal) RE: [PATCH v7 00/16] vfio: expose virtual Shared
 Virtual Addressing to VMs
Message-ID: <20201103125643.GN2620339@nvidia.com>
References: <MWHPR11MB1645CFB0C594933E92A844AC8C070@MWHPR11MB1645.namprd11.prod.outlook.com>
 <20201103095208.GA22888@8bytes.org>
Content-Disposition: inline
In-Reply-To: <20201103095208.GA22888@8bytes.org>
X-ClientProxiedBy: MN2PR22CA0008.namprd22.prod.outlook.com
 (2603:10b6:208:238::13) To BY5PR12MB3827.namprd12.prod.outlook.com
 (2603:10b6:a03:1ab::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (156.34.48.30) by
 MN2PR22CA0008.namprd22.prod.outlook.com (2603:10b6:208:238::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Tue, 3 Nov 2020 12:56:45 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1kZvrf-00Ftcf-Kk; Tue, 03 Nov 2020 08:56:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1604408215; bh=b+pbF42oMUQw1m5KD73EvM2ZL1kG2Sbe9aC/BOgbG2Q=;
 h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:Date:
 From:To:CC:Subject:Message-ID:References:Content-Type:
 Content-Disposition:In-Reply-To:X-ClientProxiedBy:MIME-Version:
 X-MS-Exchange-MessageSentRepresentingType;
 b=HtAUZXDIMC2uQcH6EIhKC/VZ2wKJLx2ikXSpb8QZjPYP/TPICOqnKnRiBO7f8p4+w
 0QTcQUjPUBYvNodFVX3FVlphGGT+lpSdYhIeYk8ypmAYtyHy8gJbkjI2wIarKOCzCe
 UbsIGu2UqJXwKQfpAF+8zDmtLJsKRhYs6TvIlXI1gdZVKbedsydZ+O4OW9zTCilkOB
 LlsiIZZxHGKUEanwyIznBqYGhm7DVobSv2R9TSmwCx58LhvHeA4FSCT4y0hRTz1mBm
 GrjEAOeV5nOgdrOScp5luZWaiJnEDNN3AbczSpefoYkXUnJIzjb8+bKvQ4E5/z7+ic
 32w72sFDguzrQ==
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

On Tue, Nov 03, 2020 at 10:52:09AM +0100, joro@8bytes.org wrote:
> So having said this, what is the benefit of exposing those SVA internals
> to user-space?

Only the device use of the PASID is device specific, the actual PASID
and everything on the IOMMU side is generic.

There is enough API there it doesn't make sense to duplicate it into
every single SVA driver.

Jason
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
