Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0164DB3AB
	for <lists.iommu@lfdr.de>; Wed, 16 Mar 2022 15:49:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0852D40A2E;
	Wed, 16 Mar 2022 14:49:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sOU_FzjwQa4V; Wed, 16 Mar 2022 14:49:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 866C440222;
	Wed, 16 Mar 2022 14:49:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5F4DCC0033;
	Wed, 16 Mar 2022 14:49:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3793FC000B
 for <iommu@lists.linux-foundation.org>; Wed, 16 Mar 2022 14:49:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3445A84219
 for <iommu@lists.linux-foundation.org>; Wed, 16 Mar 2022 14:49:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=amd.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wHNxoCDwPwcF for <iommu@lists.linux-foundation.org>;
 Wed, 16 Mar 2022 14:49:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on20605.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e83::605])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 857C0841AC
 for <iommu@lists.linux-foundation.org>; Wed, 16 Mar 2022 14:49:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZrhYjRZtV5lLFFe9IVvB2U3I63/KRa5GTZOWsTS6Ly2+4nIXAf5rz6O07QQz0ZRQkl3MZtdP3dBUCn4gkAoahumdGiBa6qnu6WCPiLZBwfJ+4AZuAAs6AlwZ2KYcMWrWibQKeXfFcDwFbEDxNJN4jlYcO8XQZZlUT8TFCWla3TyKcB9u+ySeXgqYilsQj/knVDnvdBbs402NMkPU52qM03/awu9kz2Na8MA9jpwJcHAsYxyU6iCjm1QTtqBvvJRG1OUwjWujmjtkbbOfBy+GTUCXdXcf7fb+jFtI/xqsx62NxgIWjooCmILa8fEzjCjKhh94YK+qK+9oIFn/4eWphg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gkhOpsDClOyQyTqCx3wpvZQj2kPrB2HQ7fcDHzeWrYM=;
 b=JtsrKPkgl8sTxpmalIhQWPCYA6Ixx7vV+MUwMvhdu25MwYIOd3xyEwbd4EP/iK+LvvPOdFDylatBTt0nEl0jiEHJWTbRlzPW4luDYPvEboJ40x/WkkksZ8S03Rpb9SFPZxS/gc0P0KDuaXQZBnzWvii3cCDJaBDzB2aDZyCzA0PbembxSl+s960qM0SNYl/pbh4sEcgV4PueVLal8wPa8QDRdlhuy7kIQKlDYKovhSYM04FxNDKQVjE4t9i8oK6jZSw5Nso4FDf3uXqh3WDuUSnIl3Iaunr3eyGd0zka8wQXPEoP+mKw2KyVOzvbwhHrE+Ot9YxDWl6BD2lHv4S5iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gkhOpsDClOyQyTqCx3wpvZQj2kPrB2HQ7fcDHzeWrYM=;
 b=gGJKpq9Qcnq1Ca/87mQ1M7SxuyfILEKaWAXw2uz6EaFy6dLMY+l5SrqJEwxLWOBr3JjoSXJvKPcStiN3MKe1jcncAHBqY0CP+MV3BHdnuPWqpXPkCK0zSjAbYPpXEIsQ5a/s0c2MTwxOgSJ+ldDi2gqmOeLeLbL/eliJoB9BOW0=
Received: from BL1PR12MB5157.namprd12.prod.outlook.com (2603:10b6:208:308::15)
 by DM6PR12MB4926.namprd12.prod.outlook.com (2603:10b6:5:1bb::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Wed, 16 Mar
 2022 14:49:45 +0000
Received: from BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::692d:9532:906b:2b08]) by BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::692d:9532:906b:2b08%5]) with mapi id 15.20.5081.014; Wed, 16 Mar 2022
 14:49:45 +0000
To: Mika Westerberg <mika.westerberg@linux.intel.com>, Robin Murphy
 <robin.murphy@arm.com>
Subject: RE: [PATCH] thunderbolt: Stop using iommu_present()
Thread-Topic: [PATCH] thunderbolt: Stop using iommu_present()
Thread-Index: AQHYOSidJZwMFUwbGEibeELZIyT74azB9QiAgAAcdKA=
Date: Wed, 16 Mar 2022 14:49:45 +0000
Message-ID: <BL1PR12MB515799C0BE396377DBBEF055E2119@BL1PR12MB5157.namprd12.prod.outlook.com>
References: <b4356b228db9cb88d12db6559e28714ce26e022e.1647429348.git.robin.murphy@arm.com>
 <YjHb1xCx4UAmUjrR@lahna>
In-Reply-To: <YjHb1xCx4UAmUjrR@lahna>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2022-03-16T14:27:08Z; 
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=6f364d29-d35c-4aa5-94fd-8b1414711f0d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_enabled: true
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_setdate: 2022-03-16T14:49:44Z
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_method: Privileged
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_name: Public-AIP 2.0
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_actionid: abca931e-ec87-4507-bc30-2b107d28ea0f
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 58302072-b144-4bd9-8553-08da075c366d
x-ms-traffictypediagnostic: DM6PR12MB4926:EE_
x-microsoft-antispam-prvs: <DM6PR12MB4926CF9571BAAC1CF9805E46E2119@DM6PR12MB4926.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jjHmWZTeeCDX83/rkN+U6D7JxobXhYfkwtZLWD07mLQDh0Am85sT9hGA+xhVLntJ+QIFdxuWzzh3h43CReP+xjRJ/YabnLnCm7USVkpCR9rtI8sIfdUO/LfpMVwBTUfw90oT07L9zXjYDUi7YzMewNjwFcragkDTuU3kltH8IJVTeD1FqX8UipNK2+cirlFgtAc8QcjcESO9lqkkNCaQWXgUePlHO+wu6iCDBf2PHPduNyG5FnHn1w5QLW2w0+j+s2+uBf0V6zU+3frZmzQYKJvGXLy+KazynbgodBHcKHYhIuY1myNRc9hvtUiBvA4Mpx7HKxgU4kGCGj/fr/TMU67X7JYdlNPMcG8qpKbicgL+4Udi4KV/Z3gQc6R0MMkH0W/CM4v9Aqd+4DOjnnKp6H81yxpEQZpxZqX7MX4ye5BDJmmVoV98G6ODWgacht3o+s516PtFOAY6+Yeg+ZIz+/UstJSCXl56G1S95J6RGntf6jSYdQ66ZqgsITbGTysxAUm86bxLIvGXEVfCEQZuvIExl1daU4PqmS0KddF1alvufg37Lyv07pV5ooDfgdgu8t3KoEda+kIhwknODGMud+fUBLjRblirn5U2ygMFHwudSGsL6VvF+Z858fLAYo/UPeWuRO2ZP9g/WF3OKZzBqXCyVPpWQ0gtN3uwtdtEHqsuPhicPBANJEVvfYVed1nt/cB4eL0Lh7s3sQ4eKYMHJA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5157.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(53546011)(9686003)(7696005)(6506007)(71200400001)(508600001)(33656002)(38100700002)(5660300002)(2906002)(122000001)(316002)(38070700005)(110136005)(86362001)(54906003)(52536014)(8936002)(64756008)(66556008)(66476007)(66446008)(55016003)(4326008)(66946007)(8676002)(76116006)(83380400001)(186003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ZnXQN99fdwfKntvZYtO0m9EEecIdi/RLnf0Hfg1PSGkUJX20xMhhKrWHojiL?=
 =?us-ascii?Q?rh8z3AyPRtqBBUi9XhhJyye1PRon+bLKB21pbbdnRUNFsryh0VdMmW4KdCzm?=
 =?us-ascii?Q?8RuBCkkF6IZrv+o7PMhnF82fgi2czkond87+6gnsWP4HD8bTKhKVMDnBN4Bx?=
 =?us-ascii?Q?3uRqvaAILuEoZtTWBPhWQlX7QkBhNX9KTGgfVenxeyvNYO6mQ+edUCL6lr5q?=
 =?us-ascii?Q?eE/ynhJFs3JXFLLvuvKL6OIY80HmzZ1ze5Co0UsNHFWFv7zvXoBsLHeYDNHt?=
 =?us-ascii?Q?TOOwnpLjV0p7F8PE91+z/Xk5Rocje4uUCi7QfinFP0ZIcEXdAf8dn5K3i25X?=
 =?us-ascii?Q?fSItPHm5sahf8x3wWRxjUNlAdj0+N16u5YvhQ94gKiTTu382/dmu9vrI84dR?=
 =?us-ascii?Q?ll2CcYiUZWv1Fv5F8lc7H0EosjW++x1+r/jrMb33WMmAqW0rxggDFvqGqxNL?=
 =?us-ascii?Q?7o3/hlHBr3N3vwWqJnkg+dmlK1ozAHHV4zta0mVnffB3J0DiFtnBVjEX0+KW?=
 =?us-ascii?Q?gOAZPHpE9G8+hVyEB+q98AL01wPfPKqtoThePLHJVBALz5IQQgw3ubYWrab4?=
 =?us-ascii?Q?hDqXi+A87S5QYlhRvNDim0OERMPxobyCpbN5ugxKxeARCH7dzU9fYWcMU+Kh?=
 =?us-ascii?Q?H9Mdh2Bmo6PJTfXJk+7gV4FfQv1AjqrCNsoXtC+wOqyWP7V02fFR05ZzVkl8?=
 =?us-ascii?Q?AtHWA0kBmJAgdOX1JiFPiRcIo/fV+cV8q/P26t+PPrYvRDaLkML+G4bHu4Ap?=
 =?us-ascii?Q?uQUp+NFkwfiUlXX/v2Bkrr3uf2a9ViG9XvBxNhNQQmjUp+2uC1xJC+NL9pGy?=
 =?us-ascii?Q?dCVybhmgIBHMa3soXYt4VUIF7uEV6YQzGOHzDbxUIwdd0oKPpw9C6lxTtEb0?=
 =?us-ascii?Q?eUDOVjWbgrye5rq3Njl4Uta3p8gyiGtT97w7ikfErjZ+IyKzV4biTH9u32NM?=
 =?us-ascii?Q?0na8flPCEJ73meXtmOXBqnGJwoRLH1ND/2riI8tBCDIWCPHruKAhuw1nx4lU?=
 =?us-ascii?Q?Yt+14t1BoejayyOF2zRL+OvslTuB4loVGiwjxaxA684RLj/di7xR77QEsRoq?=
 =?us-ascii?Q?FbJ4ZcaDwEqKIq4oN/EJGhsiFg6q7550uDy4M/upxsrF5em/qkZrvBmuuY9r?=
 =?us-ascii?Q?LKNVKNaSpsSC/PcGMFGDdp71kEp/8sfy68apDKcOHRzMaROR1ie35Ln9ABK2?=
 =?us-ascii?Q?wpkRUT8RwLlw+W3dd5HoPrBh8BdEUmwJGqquSoKXQ7pvj+kTpdV61pnSL2V6?=
 =?us-ascii?Q?MpFvi6tZR7h6jwK8NvY22R5I4AqWBZ43KyBBAIskq8ynUwx4pQkZc08pLaSz?=
 =?us-ascii?Q?Lv6F9w8LNIaIbWj7grhJ9QOTgugObcofzPWxwf9kjO06ulEbsHCYwTtajL3f?=
 =?us-ascii?Q?+iU0je2Jrmgd6PRGHvU3TRIp6GxTR9cWbNm7DzOdb0Wb92J0pUgk6X+CV2zn?=
 =?us-ascii?Q?kl9jkI4VR64izwGcGAx4GWmtWsjqdPMHFcCTL0haC26ocYWiwi4l4SNTblE2?=
 =?us-ascii?Q?DNyKJ9ih3OePIr3E619lEfoWoZfhGnpy7TnE?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5157.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58302072-b144-4bd9-8553-08da075c366d
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2022 14:49:45.6617 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KRW5ZdzuORSYHoTxGGtVfR69/TJO+L3s5Ub2Qu8yyqgAhNnCWpYjQGXpngMuq10+7VqLDykSYCFQwM2In2DnrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4926
Cc: "michael.jamet@intel.com" <michael.jamet@intel.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "YehezkelShB@gmail.com" <YehezkelShB@gmail.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "andreas.noever@gmail.com" <andreas.noever@gmail.com>,
 "hch@lst.de" <hch@lst.de>
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
From: "Limonciello, Mario via iommu" <iommu@lists.linux-foundation.org>
Reply-To: "Limonciello, Mario" <Mario.Limonciello@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

[Public]



> -----Original Message-----
> From: Mika Westerberg <mika.westerberg@linux.intel.com>
> Sent: Wednesday, March 16, 2022 07:45
> To: Robin Murphy <robin.murphy@arm.com>
> Cc: andreas.noever@gmail.com; michael.jamet@intel.com;
> YehezkelShB@gmail.com; linux-usb@vger.kernel.org; linux-
> kernel@vger.kernel.org; iommu@lists.linux-foundation.org; Limonciello,
> Mario <Mario.Limonciello@amd.com>; hch@lst.de
> Subject: Re: [PATCH] thunderbolt: Stop using iommu_present()
> 
> Hi Robin,
> 
> On Wed, Mar 16, 2022 at 11:25:51AM +0000, Robin Murphy wrote:
> > Even if an IOMMU might be present for some PCI segment in the system,
> > that doesn't necessarily mean it provides translation for the device
> > we care about. Furthermore, the presence or not of one firmware flag
> > doesn't imply anything about the IOMMU driver's behaviour, which may
> > still depend on other firmware properties and kernel options too. What
> > actually matters is whether an IOMMU is enforcing protection for our
> > device - regardless of whether that stemmed from firmware policy, kernel
> > config, or user control - at the point we need to decide whether to
> > authorise it. We can ascertain that generically by simply looking at
> > whether we're currently attached to a translation domain or not.
> >

Suggest you include a link to the discussion(s) that spurred this too in commit message.

> > Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> > ---
> >
> > I don't have the means to test this, but I'm at least 80% confident
> > in my unpicking of the structures to retrieve the correct device...

I did check that as a result of this:
* Turning IOMMU to pass through leads to iommu_dma_protection of 0
* Leaving IOMMU enabled leads to iommu_dma_protection of 1

I suspect you'll respin this on the below comment, but if you do keep it:
Tested-by: Mario Limonciello <mario.limonciello@amd.com>

> >
> >  drivers/thunderbolt/domain.c | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/thunderbolt/domain.c b/drivers/thunderbolt/domain.c
> > index 7018d959f775..5f5fc5f6a09b 100644
> > --- a/drivers/thunderbolt/domain.c
> > +++ b/drivers/thunderbolt/domain.c
> > @@ -257,13 +257,14 @@ static ssize_t
> iommu_dma_protection_show(struct device *dev,
> >  					 struct device_attribute *attr,
> >  					 char *buf)
> >  {
> > +	struct tb *tb = container_of(dev, struct tb, dev);
> > +	struct iommu_domain *iod = iommu_get_domain_for_dev(&tb-
> >nhi->pdev->dev);
> 
> I wonder if this is the correct "domain"? I mean it's typically no the
> Thunderbolt controller (here tb->nhi->pdev->dev) that needs the
> protection (although in discrete controllers it does get it too) but
> it's the tunneled PCIe topology that we need to check here.
> 
> For instance in Intel with intergrated Thunderbolt we have topology like
> this:
> 
>   Host bridge
>       |
>       +--- Tunneled PCIe root port #1
>       +--- Tunneled PCIe root port #2
>       +--- Thunderbolt host controller (the NHI above)
>       +--- xHCI
> 
> and In case of discrete controllers it looks like this:
> 
>   Host bridge
>       |
>       +--- PCIe root port #x
>                 |
>                 |
>            PCIe switch upstream port
>                 |
> 	        +--- Tunneled PCIe switch downstream port #1
> 	        +--- Tunneled PCIe switch downstream port #2
>         	+--- Thunderbolt host controller (the NHI above)
>         	+--- xHCI
> 
> What we want is to make sure the Tunneled PCIe ports get the full IOMMU
> protection. In case of the discrete above it is also fine if all the
> devices behind the PCIe root port get the full IOMMU protection. Note in
> the integrated all the devices are "siblings".

I think below is what you are looking for (on top of your patch).  This checks the NHI, and then also checks all those siblings Mika referred to.

diff --git a/drivers/thunderbolt/domain.c b/drivers/thunderbolt/domain.c
index 5f5fc5f6a09b..b17961ba1396 100644
--- a/drivers/thunderbolt/domain.c
+++ b/drivers/thunderbolt/domain.c
@@ -259,12 +259,25 @@ static ssize_t iommu_dma_protection_show(struct device *dev,
 {
        struct tb *tb = container_of(dev, struct tb, dev);
        struct iommu_domain *iod = iommu_get_domain_for_dev(&tb->nhi->pdev->dev);
+       struct device_link *link;
+       bool protected;
+
        /*
         * Kernel DMA protection is a feature where Thunderbolt security is
         * handled natively using IOMMU. It is enabled when IOMMU is
         * enabled and actively enforcing translation.
         */
-       return sprintf(buf, "%d\n", iod && iod->type != IOMMU_DOMAIN_IDENTITY);
+       protected = iod && iod->type != IOMMU_DOMAIN_IDENTITY;
+       if (protected) {
+               list_for_each_entry(link, &tb->nhi->pdev->dev.links.consumers, s_node) {
+                       if (protected && pci_pcie_type(to_pci_dev(link->consumer)) == PCI_EXP_TYPE_ROOT_PORT) {
+                               iod = iommu_get_domain_for_dev(link->consumer);
+                               if (!iod || iod->type == IOMMU_DOMAIN_IDENTITY)
+                                       protected = false;
+                       }
+               }
+       }
+       return sprintf(buf, "%d\n", protected);
 }
 static DEVICE_ATTR_RO(iommu_dma_protection);
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
