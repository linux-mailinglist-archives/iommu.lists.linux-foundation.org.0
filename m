Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 913DD1C78A9
	for <lists.iommu@lfdr.de>; Wed,  6 May 2020 19:50:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4DDAF87E38;
	Wed,  6 May 2020 17:50:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LEvExKf+YueU; Wed,  6 May 2020 17:50:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9426E87587;
	Wed,  6 May 2020 17:50:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8CA3DC0859;
	Wed,  6 May 2020 17:50:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 52914C0859
 for <iommu@lists.linux-foundation.org>; Wed,  6 May 2020 17:50:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 41EBE2011B
 for <iommu@lists.linux-foundation.org>; Wed,  6 May 2020 17:50:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gB5U65GFLOo5 for <iommu@lists.linux-foundation.org>;
 Wed,  6 May 2020 17:50:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by silver.osuosl.org (Postfix) with ESMTPS id 732641FD16
 for <iommu@lists.linux-foundation.org>; Wed,  6 May 2020 17:50:53 +0000 (UTC)
IronPort-SDR: YOarMGLeU+et6e7sz08LIyIjeiTRx05QhOIrijmuxneq69FIhoGYP9+ABmkBC+qFcGI+TLCJPc
 3s7Hpa6EUuiA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2020 10:50:52 -0700
IronPort-SDR: xm8tvqQxOE1rPKi9rbOCo7TO3uBzKdp1kfpW8KZL0EdRthEnS3SB3m0Ijjh17ghi7cG2E/af2F
 YVm1NUd2QXMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,360,1583222400"; d="scan'208";a="461518608"
Received: from orsmsx102.amr.corp.intel.com ([10.22.225.129])
 by fmsmga005.fm.intel.com with ESMTP; 06 May 2020 10:50:51 -0700
Received: from orsmsx158.amr.corp.intel.com (10.22.240.20) by
 ORSMSX102.amr.corp.intel.com (10.22.225.129) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 6 May 2020 10:50:50 -0700
Received: from orsmsx101.amr.corp.intel.com ([169.254.8.204]) by
 ORSMSX158.amr.corp.intel.com ([169.254.10.56]) with mapi id 14.03.0439.000;
 Wed, 6 May 2020 10:50:49 -0700
From: "Derrick, Jonathan" <jonathan.derrick@intel.com>
To: "baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>,
 "drake@endlessm.com" <drake@endlessm.com>
Subject: Re: [PATCH v4 0/3] Replace private domain with per-group default
 domain
Thread-Topic: [PATCH v4 0/3] Replace private domain with per-group default
 domain
Thread-Index: AQHWI0qLt8RTAcgRzUWht5gocxEdBqiaxYyAgAEGfQA=
Date: Wed, 6 May 2020 17:50:48 +0000
Message-ID: <d0fa0782473f5c7ef63dcded596ab6694b74b149.camel@intel.com>
References: <20200506015947.28662-1-baolu.lu@linux.intel.com>
 <CAD8Lp47E2CDmHTEGSpqYfxxKB4a+JY6VzZdL9e65P7YxqfL9Ag@mail.gmail.com>
In-Reply-To: <CAD8Lp47E2CDmHTEGSpqYfxxKB4a+JY6VzZdL9e65P7YxqfL9Ag@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.254.179.93]
Content-ID: <07B3CD54AE2C8B4387A28686CBB77ED0@intel.com>
MIME-Version: 1.0
Cc: "Tian, Kevin" <kevin.tian@intel.com>, "Raj, Ashok" <ashok.raj@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>, "hch@lst.de" <hch@lst.de>
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

On Wed, 2020-05-06 at 10:09 +0800, Daniel Drake wrote:
> On Wed, May 6, 2020 at 10:03 AM Lu Baolu <baolu.lu@linux.intel.com> wrote:
> > https://lkml.org/lkml/2020/4/14/616
> > [This has been applied in iommu/next.]
> > 
> > Hence, there is no need to keep the private domain implementation
> > in the Intel IOMMU driver. This patch series aims to remove it.
> 
> I applied these patches on top of Joerg's branch and confirmed that
> they fix the issue discussed in the thread:
> 
> [PATCH v2] iommu/vt-d: consider real PCI device when checking if
> mapping is needed
> (the patch there is no longer needed)
> 
> Tested-by: Daniel Drake <drake@endlessm.com>
> 
> Thanks!

Looks like the key to the real DMA dev fix was removing
identity_mapping() paths that led to dev->archdata.iommu == NULL -> DMA
domain

Works great for me as well

Reviewed-by: Jon Derrick <jonathan.derrick@intel.com>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
