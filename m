Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E974D44ED
	for <lists.iommu@lfdr.de>; Thu, 10 Mar 2022 11:45:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4023584375;
	Thu, 10 Mar 2022 10:45:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WVgtEO5PgFqq; Thu, 10 Mar 2022 10:45:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 53A098430E;
	Thu, 10 Mar 2022 10:45:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 09FD3C000B;
	Thu, 10 Mar 2022 10:45:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 523F0C000B
 for <iommu@lists.linux-foundation.org>; Thu, 10 Mar 2022 10:45:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D84E611EE
 for <iommu@lists.linux-foundation.org>; Thu, 10 Mar 2022 10:45:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nxHLOzkqOI98 for <iommu@lists.linux-foundation.org>;
 Thu, 10 Mar 2022 10:45:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F2D00611F9
 for <iommu@lists.linux-foundation.org>; Thu, 10 Mar 2022 10:45:53 +0000 (UTC)
Received: from dggpemm500020.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4KDm0B5Kc7zfYqJ;
 Thu, 10 Mar 2022 18:44:26 +0800 (CST)
Received: from dggpemm100008.china.huawei.com (7.185.36.125) by
 dggpemm500020.china.huawei.com (7.185.36.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Thu, 10 Mar 2022 18:45:50 +0800
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 dggpemm100008.china.huawei.com (7.185.36.125) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Thu, 10 Mar 2022 18:45:49 +0800
Received: from lhreml710-chm.china.huawei.com ([169.254.81.184]) by
 lhreml710-chm.china.huawei.com ([169.254.81.184]) with mapi id
 15.01.2308.021; Thu, 10 Mar 2022 10:45:47 +0000
To: "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-acpi@vger.kernel.org"
 <linux-acpi@vger.kernel.org>, "iommu@lists.linux-foundation.org"
 <iommu@lists.linux-foundation.org>
Subject: RE: [PATCH v8 03/11] ACPI/IORT: Add helper functions to parse RMR
 nodes
Thread-Topic: [PATCH v8 03/11] ACPI/IORT: Add helper functions to parse RMR
 nodes
Thread-Index: AQHYJzoU7y0scyFWHEWb6SBtCVveFqy4hbiAgAAB0fA=
Date: Thu, 10 Mar 2022 10:45:47 +0000
Message-ID: <464edc7655514a89afd5d91a4553da4d@huawei.com>
References: <20220221154344.2126-1-shameerali.kolothum.thodi@huawei.com>
 <20220221154344.2126-4-shameerali.kolothum.thodi@huawei.com>
 <d5740467-f070-bd29-5ef4-de071b751292@redhat.com>
In-Reply-To: <d5740467-f070-bd29-5ef4-de071b751292@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.47.85.233]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Cc: "robin.murphy@arm.com" <robin.murphy@arm.com>,
 "jon@solid-run.com" <jon@solid-run.com>, Linuxarm <linuxarm@huawei.com>,
 "steven.price@arm.com" <steven.price@arm.com>, "Guohanjun \(Hanjun
 Guo\)" <guohanjun@huawei.com>, yangyicong <yangyicong@huawei.com>,
 "Sami.Mujawar@arm.com" <Sami.Mujawar@arm.com>,
 "will@kernel.org" <will@kernel.org>, wanghuiqiang <wanghuiqiang@huawei.com>
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
From: Shameerali Kolothum Thodi via iommu <iommu@lists.linux-foundation.org>
Reply-To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Hi Eric,

> -----Original Message-----
> From: Eric Auger [mailto:eric.auger@redhat.com]
> Sent: 10 March 2022 10:32
> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>;
> linux-arm-kernel@lists.infradead.org; linux-acpi@vger.kernel.org;
> iommu@lists.linux-foundation.org
> Cc: Linuxarm <linuxarm@huawei.com>; lorenzo.pieralisi@arm.com;
> joro@8bytes.org; robin.murphy@arm.com; will@kernel.org; wanghuiqiang
> <wanghuiqiang@huawei.com>; Guohanjun (Hanjun Guo)
> <guohanjun@huawei.com>; steven.price@arm.com; Sami.Mujawar@arm.com;
> jon@solid-run.com; yangyicong <yangyicong@huawei.com>
> Subject: Re: [PATCH v8 03/11] ACPI/IORT: Add helper functions to parse RMR
> nodes
> 
> Hi Shameer,
> 
> On 2/21/22 4:43 PM, Shameer Kolothum wrote:
> > The helper functions here parse through the IORT RMR nodes and
> > populate a reserved region list  corresponding to a given iommu
> > and device(optional). These also go through the ID mappings of
> > the RMR node and retrieves all the SIDs associated with a RMR
> > descriptor.
> >
> > Signed-off-by: Shameer Kolothum
> <shameerali.kolothum.thodi@huawei.com>
> > ---
> >  drivers/acpi/arm64/iort.c | 225
> ++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 225 insertions(+)
> >
> > diff --git a/drivers/acpi/arm64/iort.c b/drivers/acpi/arm64/iort.c
> > index 0730c4dbb700..05da9ebff50a 100644
> > --- a/drivers/acpi/arm64/iort.c
> > +++ b/drivers/acpi/arm64/iort.c
> > @@ -830,6 +830,231 @@ static struct acpi_iort_node
> *iort_get_msi_resv_iommu(struct device *dev)
> >  	return NULL;
> >  }
> >
[...]

> > +static void iort_find_rmrs(struct acpi_iort_node *iommu, struct device *dev,
> > +			   struct list_head *head)
> > +{
> > +	struct acpi_table_iort *iort;
> > +	struct acpi_iort_node *iort_node, *iort_end;
> > +	int i;
> > +
> > +	if (iort_table->revision < 5)
> This means E.b and E.c revs are not supported. Is it what we want?

Yes. E.b lacks memory attributes info associated with RMR node. Though E.c 
added those, it broke backward compatibility with ACPICA E.b support and
is now deprecated.

Thanks,
Shameer


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
