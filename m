Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BEE4E5F48
	for <lists.iommu@lfdr.de>; Thu, 24 Mar 2022 08:25:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D227884190;
	Thu, 24 Mar 2022 07:25:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 982JjDc-5bHZ; Thu, 24 Mar 2022 07:25:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id C14918418B;
	Thu, 24 Mar 2022 07:25:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 884C0C000B;
	Thu, 24 Mar 2022 07:25:12 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C4FAAC000B
 for <iommu@lists.linux-foundation.org>; Thu, 24 Mar 2022 07:25:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AC53440629
 for <iommu@lists.linux-foundation.org>; Thu, 24 Mar 2022 07:25:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=intel.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wnyh7jF0ehMy for <iommu@lists.linux-foundation.org>;
 Thu, 24 Mar 2022 07:25:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 24820404F9
 for <iommu@lists.linux-foundation.org>; Thu, 24 Mar 2022 07:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648106709; x=1679642709;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bl2t5LdGFwFzXWuH6qE52rN5pbiXE4zXqfJWLtCCLNI=;
 b=BkduCrhMLUNmxFeyaNnLLLd0zaaibgJ/rhfD2BIjF/W8dDXsnDDgqjch
 z8D9EOpcPj9HS4VEJ5S6KY/7LpzaUN9AEpOdrXgICWiZNt2iVg/unkpBU
 hfCWB8VvFfIFDAYxa2A3xaeOeQUmxRSBsx+qsFkRSX3GDBUBj2K1GpENE
 yKQ+wFZaKnJCKYWiGYqQOv0HieqLt/azVEqWjhtIVJg3N/p0COs9D0LhM
 6ARrcNiKK6dKWl8jyLqEgTWnso16ww2exQpDsxmG7mai8aRhsdApn6Jmp
 4F3VQGu2luU2mJUCjMhaN7jRNL4P+yHryCq+ghHWt0VSurVz+3JE/vkIt A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10295"; a="258259753"
X-IronPort-AV: E=Sophos;i="5.90,206,1643702400"; d="scan'208";a="258259753"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2022 00:25:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,206,1643702400"; d="scan'208";a="501293880"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga003.jf.intel.com with ESMTP; 24 Mar 2022 00:25:06 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 24 Mar 2022 00:25:05 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 24 Mar 2022 00:25:05 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 24 Mar 2022 00:25:05 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Thu, 24 Mar 2022 00:25:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f+koCav5Ri7DwHrjYN3UWae4OQqOhVtSasiyYDM24u1+gz0xgUNc0chrOe14ymk3HYmWVcYdy38gQFgcY4BYvJhHQ3rDrjd5J9Vt1GScHoQIeIWX7yVL0n0gLsVaXDC38pQZLQAUy+0+e5o5r8CDc2dW0TfWEQuBTKkSQ7MiPP45FEId6oadVeNnLpEtvt4dMkp+4OyD7vX3709cu0h8G5NIvVutwq5teQis0v2WO7oqx9oHRolqqFseSduRNk6FAwulEtNH8GyrCmB0yGEpTtuW9DRqUO5zjL+NmtICeI/v1KQYM/Fe8IwnXwT4KORlWQiPYMIzzhCQS9dZ2YMDxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eaccpdY/zQgUzMEVKquMaaI9mrbxJsIAwvnv9XIiGoI=;
 b=aMjt5FHNjiTfsAxfI47AjxJoBhhLxg6idtfxmaGTYY4EMtH+u0XavHQMa7vExGEZPr9lcaskUl89beGF5pj3C51XQWNOveWacJXka+Y1kInUWdlm0dJhwaHEEhLAapLDynOORr5uYWjSwMDTIo+YxLsDuuMXWYJ/bYj2gGm9/oiuVKV9BCMED8MfDlhqbHsoVeUqt6zN/SS7vrGcQSaXTejVKj4c5cr7euWkIDhS4rIsIJgLV8ceAbtzDlPprHXPrtzXpNr0wAPGc+A+dTTZOWXYUjNDA8N1320QlXJ2Mux5VsDEeGRD9iNHIPa635PDmonIB6CsPveOvYudea/8xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by MWHPR11MB1295.namprd11.prod.outlook.com (2603:10b6:300:2b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.18; Thu, 24 Mar
 2022 07:25:03 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::4df7:2fc6:c7cf:ffa0]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::4df7:2fc6:c7cf:ffa0%4]) with mapi id 15.20.5102.018; Thu, 24 Mar 2022
 07:25:03 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, Alex Williamson
 <alex.williamson@redhat.com>
Subject: RE: [PATCH RFC 08/12] iommufd: IOCTLs for the io_pagetable
Thread-Topic: [PATCH RFC 08/12] iommufd: IOCTLs for the io_pagetable
Thread-Index: AQHYOu2GUDY5OA7cJEqND2xJuT5HJqzNXYEAgAAGtoCAAAhqAIAACEAAgAAnNgCAAIPcQA==
Date: Thu, 24 Mar 2022 07:25:03 +0000
Message-ID: <BN9PR11MB5276EB80AFCC3003955A46248C199@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <0-v1-e79cd8d168e8+6-iommufd_jgg@nvidia.com>
 <8-v1-e79cd8d168e8+6-iommufd_jgg@nvidia.com>
 <20220323131038.3b5cb95b.alex.williamson@redhat.com>
 <20220323193439.GS11336@nvidia.com>
 <20220323140446.097fd8cc.alex.williamson@redhat.com>
 <20220323203418.GT11336@nvidia.com> <20220323225438.GA1228113@nvidia.com>
In-Reply-To: <20220323225438.GA1228113@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cdba3d3e-0677-48bd-be0b-08da0d6769e2
x-ms-traffictypediagnostic: MWHPR11MB1295:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <MWHPR11MB12951CB45683D856246CF4F68C199@MWHPR11MB1295.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2yu0praRdRkCULa+sS2JFDwnoE8hSEgwFxIeGODqbH5uUAxWjbvjTDyCC1Gs/a4/ZcRNXc9rXd2idcpz/P9IWuwTQ0a9MygdnIaMbXN1BbmbwFKL4AuGSqy+MxSDSzW0pq/Oli27Q5ARN1zOuPMxrRkGzmzRv6t+CJxocKOViCz7CUIoyBspRmhVYoDkIs6g4eop2p//8T7YwCuQTwUkUNSUZmT6zIF72Xu7EmRsRPYWTyKKSxiIQpXSf+SybNj74VBpjQ34+oIYOLrNDbLnqln/RoFvjmDZ34CkNorj2R2x5IqAjNrziFuHcxOoG+cU+4YZtc17fHE1nOcupIrAu4dYSuXHoONF+qbxmUKcF/pUHVktaPrmDmlbt2KqVak9O9ruzlBNrW8tatRADvHfylr+T0fwMVhl8s/of3Gpu8KLybh/Rl7YCbFgSPWKrcUbn3S+J6MfeMlF8LJC5LHA98phhHDVc/ydIEoOZlCAFHLvke7aHveeda51ryNBCFM/yDhNcZ/guk9+fISgf3t1Venhvag6u92s1r/+jdY4IYMz2uSQ2mp9QjEHiUuc/qUDfHE7boAXHjOxxTyyzt1hYSJuQK8xZzdXRcLgkWa7V+KlPivruAXq+N4/io96ow4yxPE7HoDZbhK9/wlXdsuyp4UAR1cayqaSLUza/J2mRsiQC3szRaxMQf9H4A81EsLEZvt/2ZQ7+lMHX6eXEFccNw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(83380400001)(8676002)(7696005)(4326008)(33656002)(2906002)(55016003)(86362001)(6506007)(66476007)(76116006)(64756008)(66446008)(66556008)(66946007)(122000001)(38100700002)(52536014)(82960400001)(38070700005)(8936002)(7416002)(5660300002)(508600001)(71200400001)(9686003)(26005)(186003)(110136005)(54906003)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?WrXfucVQhSuvtJK0FXlAnZJQn59rBAionz3VKL1jpgaHDaOzjxbcNh6tORoh?=
 =?us-ascii?Q?izSn3YR/cxehjjZejjm/DNaooVRm5tA7kQL92AzwkNsUa9lAeCRYhqceianb?=
 =?us-ascii?Q?oa41qBGfoXF3a5oCeolJbGYPImk1hs/mj+BTq7Z0ROENaspn3Hn2Kh3asFLV?=
 =?us-ascii?Q?cP9YtTyYJm8srjC8Ol38hHYWfT1ri7gS7s46iREtemOqhYqOEIidsmnvAeWU?=
 =?us-ascii?Q?X8w/KOfsKmefg8v/wWV4ODuiOHoRr5QanicL92btVlXVrOQLJgrroYKtKDqn?=
 =?us-ascii?Q?16+0t6ekYE9UTOHiZTkei/RzEjqA4Fxg4CjNBycKkaIUCAPcBRRO1eLUnEsf?=
 =?us-ascii?Q?5+XiI/8sXReh9dse4zUSzGphhFdoFSNiwI57lV2haAX/03XcQ6pZvvcjIfT0?=
 =?us-ascii?Q?ToOQHLkkYu1WGYotQwLy4Ey3JCziFti2GGR/2WLJXnYPQXgttxuwP9ajR1XP?=
 =?us-ascii?Q?gEq/hI7vojKW28p38NbfURTAT42Pw+st/mgjXwpW0rDqAv+62f3I9+v2b+Ar?=
 =?us-ascii?Q?hnkrew69n3amQ04tkjSpzOFnN5Bf62RwmXier9LJee2mn66iAdpT4V5lHVAp?=
 =?us-ascii?Q?E57qNB65cSFbLr7SDHZXjlKjaaZvH7NAOaPfUY+z2Ulj/FN8gWsQg09APpod?=
 =?us-ascii?Q?BaP3+2lfGAxyI7vSlGBXPk//MfS8bOAl0mfHSSaUI/Uuo055GQZpeWR5qsiz?=
 =?us-ascii?Q?IJVzfxfhv3N77i5cIswtjXfC73KAbUnNp/PHbbH/mLLxoXalEEVzuldndCa4?=
 =?us-ascii?Q?Ik5ZW4MF9pMWbHmp2OkdUlW5JsmAK16bKiLyn6b9NStpkbNcZdVJgolh2H0M?=
 =?us-ascii?Q?sOcOZyPRX+UxGJ+qJAGRxU2cn/FV2O821l2hzLSLW4pOQS9tQK29o2gE363z?=
 =?us-ascii?Q?8/i8xYaamA2E6rTYUNPUZeKdlUZA/QRQVvmncQWFLMukXCM5Yw6Xm6aIxQZA?=
 =?us-ascii?Q?8dlzXvvjlLf+c9qMZ2NuR2/SpqFzjtjYmQiG2BoOEXtzLBQmd+eoxjvJFAuo?=
 =?us-ascii?Q?KiJqZuZJP0x/k76qskrCZWCqb2mVMjWs7Ikn6oX8wVvGAu13eoYZONMdD2GP?=
 =?us-ascii?Q?VF9o5ca9c2ZB0tB2VW6hsAU0JxrNKO+zri3oeQ0hbVgATPMlYiISM03atAGo?=
 =?us-ascii?Q?CRCUUkJhz51oH7C4WUAGL97JE0hyL6q1FL67AxTzE+DrStook1zZvM8Gjdad?=
 =?us-ascii?Q?2NIAoQtTC7QY8In3r6CbstuBZXtX+XwEXXD/a5f54tUANUVmR4fjE6xxWBZd?=
 =?us-ascii?Q?1inWlOyTwy+WoEDC8SJ7qVdOY3W9Ty5fZWsV7hdwrOvAl/CBcscnEEoRxCo5?=
 =?us-ascii?Q?OEqdhMFNs8IsxPLsjgvskn7AAS7eZ/NevHzcJs+ex6MmmaXP5MrRdRU1cqe8?=
 =?us-ascii?Q?X/yPF4km/rzInI2SMFhA0fod1i/j/BU0GUV4LfZNdacKzTg/Fdhm7qTL9o1h?=
 =?us-ascii?Q?1W9YU9dSjKNnLto31kkWrhAOSN6x4iH9pXP8Jh2GNsR15VOimg1yvd4tvDK6?=
 =?us-ascii?Q?N7qKBW8ThHc0nOdtr1p3Xj0GBE6M/9zkWjYLeJ0eGHhSeNcfbykx5lKEMpGr?=
 =?us-ascii?Q?LPBgvZCUoKEZecD/Ez4YzmN/fV81S/iXyihF3aAAZvoQXtk9xea0LQz6l2Ro?=
 =?us-ascii?Q?2Br71F8csOKuOiXa8c4TuVd47vjZrnnmORMjBgdwFljaLlj8p/w5NDNJCkT8?=
 =?us-ascii?Q?G4e1AUiNRoLUrAtnakdBaPMIJAvrn9YWQtU+pDa4dv+VNNcxHiwv6hJlrJ/s?=
 =?us-ascii?Q?Z1mPwsJE0w=3D=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdba3d3e-0677-48bd-be0b-08da0d6769e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2022 07:25:03.4356 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +KIgTQyRQsShZv2nsRJbIjhkyJOTDx4trSaU1OOuw3CsrDIMAUsDXnvccfi6FZlUifjfGk47419PmbgyPqToGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1295
X-OriginatorOrg: intel.com
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Chaitanya Kulkarni <chaitanyak@nvidia.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Niklas Schnelle <schnelle@linux.ibm.com>,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "Martins, Joao" <joao.m.martins@oracle.com>,
 David Gibson <david@gibson.dropbear.id.au>
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

> From: Jason Gunthorpe <jgg@nvidia.com>
> Sent: Thursday, March 24, 2022 6:55 AM
> 
> On Wed, Mar 23, 2022 at 05:34:18PM -0300, Jason Gunthorpe wrote:
> 
> > Stated another way, any platform that wires dev_is_dma_coherent() to
> > true, like all x86 does, must support IOMMU_CACHE and report
> > IOMMU_CAP_CACHE_COHERENCY for every iommu_domain the platform
> > supports. The platform obviously declares it support this in order to
> > support the in-kernel DMA API.
> 
> That gives me a nice simple idea:
> 
> diff --git a/drivers/iommu/iommufd/device.c
> b/drivers/iommu/iommufd/device.c
> index 3c6b95ad026829..8366884df4a030 100644
> --- a/drivers/iommu/iommufd/device.c
> +++ b/drivers/iommu/iommufd/device.c
> @@ -8,6 +8,7 @@
>  #include <linux/pci.h>
>  #include <linux/irqdomain.h>
>  #include <linux/dma-iommu.h>
> +#include <linux/dma-map-ops.h>
> 
>  #include "iommufd_private.h"
> 
> @@ -61,6 +62,10 @@ struct iommufd_device
> *iommufd_bind_pci_device(int fd, struct pci_dev *pdev,
>  	struct iommu_group *group;
>  	int rc;
> 
> +	/* iommufd always uses IOMMU_CACHE */
> +	if (!dev_is_dma_coherent(&pdev->dev))
> +		return ERR_PTR(-EINVAL);
> +
>  	ictx = iommufd_fget(fd);
>  	if (!ictx)
>  		return ERR_PTR(-EINVAL);
> diff --git a/drivers/iommu/iommufd/ioas.c b/drivers/iommu/iommufd/ioas.c
> index 48149988c84bbc..3d6df1ffbf93e6 100644
> --- a/drivers/iommu/iommufd/ioas.c
> +++ b/drivers/iommu/iommufd/ioas.c
> @@ -129,7 +129,8 @@ static int conv_iommu_prot(u32 map_flags)
>  	 * We provide no manual cache coherency ioctls to userspace and
> most
>  	 * architectures make the CPU ops for cache flushing privileged.
>  	 * Therefore we require the underlying IOMMU to support CPU
> coherent
> -	 * operation.
> +	 * operation. Support for IOMMU_CACHE is enforced by the
> +	 * dev_is_dma_coherent() test during bind.
>  	 */
>  	iommu_prot = IOMMU_CACHE;
>  	if (map_flags & IOMMU_IOAS_MAP_WRITEABLE)
> 
> Looking at it I would say all the places that test
> IOMMU_CAP_CACHE_COHERENCY can be replaced with
> dev_is_dma_coherent()
> except for the one call in VFIO that is supporting the Intel no-snoop
> behavior.
> 
> Then we can rename IOMMU_CAP_CACHE_COHERENCY to something like
> IOMMU_CAP_ENFORCE_CACHE_COHERENCY and just create a
> IOMMU_ENFORCE_CACHE prot flag for Intel IOMMU to use instead of
> abusing IOMMU_CACHE.
> 

Based on that here is a quick tweak of the force-snoop part (not compiled).

Several notes:

- IOMMU_CAP_CACHE_COHERENCY is kept as it's checked in vfio's
  group attach interface. Removing it may require a group_is_dma_coherent();

- vdpa is not changed as force-snoop is only for integrated GPU today which
  is not managed by vdpa. But adding the snoop support is easy if necessary;

- vfio type1 reports force-snoop fact to KVM via VFIO_DMA_CC_IOMMU. For
  iommufd the compat layer may leverage that interface but more thoughts
  are required for non-compat usage how that can be reused or whether a
  new one is required between iommufd and kvm. Per earlier  discussions
  Paolo prefers to reuse.

diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index 5b196cf..06cca04 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -5110,7 +5110,8 @@ static int intel_iommu_map(struct iommu_domain *domain,
 		prot |= DMA_PTE_READ;
 	if (iommu_prot & IOMMU_WRITE)
 		prot |= DMA_PTE_WRITE;
-	if ((iommu_prot & IOMMU_CACHE) && dmar_domain->iommu_snooping)
+	/* nothing to do for IOMMU_CACHE */
+	if ((iommu_prot & IOMMU_SNOOP) && dmar_domain->iommu_snooping)
 		prot |= DMA_PTE_SNP;
 
 	max_addr = iova + size;
@@ -5236,6 +5237,8 @@ static phys_addr_t intel_iommu_iova_to_phys(struct iommu_domain *domain,
 static bool intel_iommu_capable(enum iommu_cap cap)
 {
 	if (cap == IOMMU_CAP_CACHE_COHERENCY)
+		return true;
+	if (cap == IOMMU_CAP_FORCE_SNOOP)
 		return domain_update_iommu_snooping(NULL);
 	if (cap == IOMMU_CAP_INTR_REMAP)
 		return irq_remapping_enabled == 1;
diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
index 9394aa9..abc4cfe 100644
--- a/drivers/vfio/vfio_iommu_type1.c
+++ b/drivers/vfio/vfio_iommu_type1.c
@@ -2270,6 +2270,9 @@ static int vfio_iommu_type1_attach_group(void *iommu_data,
 	if (iommu_capable(bus, IOMMU_CAP_CACHE_COHERENCY))
 		domain->prot |= IOMMU_CACHE;
 
+	if (iommu_capable(bus, IOMMU_CAP_FORCE_SNOOP)
+		domain->prot |= IOMMU_SNOOP;
+
 	/*
 	 * Try to match an existing compatible domain.  We don't want to
 	 * preclude an IOMMU driver supporting multiple bus_types and being
@@ -2611,14 +2614,14 @@ static void vfio_iommu_type1_release(void *iommu_data)
 	kfree(iommu);
 }
 
-static int vfio_domains_have_iommu_cache(struct vfio_iommu *iommu)
+static int vfio_domains_have_iommu_snoop(struct vfio_iommu *iommu)
 {
 	struct vfio_domain *domain;
 	int ret = 1;
 
 	mutex_lock(&iommu->lock);
 	list_for_each_entry(domain, &iommu->domain_list, next) {
-		if (!(domain->prot & IOMMU_CACHE)) {
+		if (!(domain->prot & IOMMU_SNOOP)) {
 			ret = 0;
 			break;
 		}
@@ -2641,7 +2644,7 @@ static int vfio_iommu_type1_check_extension(struct vfio_iommu *iommu,
 	case VFIO_DMA_CC_IOMMU:
 		if (!iommu)
 			return 0;
-		return vfio_domains_have_iommu_cache(iommu);
+		return vfio_domains_have_iommu_snoop(iommu);
 	default:
 		return 0;
 	}
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index de0c57a..45184d7 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -21,6 +21,8 @@
 #define IOMMU_CACHE	(1 << 2) /* DMA cache coherency */
 #define IOMMU_NOEXEC	(1 << 3)
 #define IOMMU_MMIO	(1 << 4) /* e.g. things like MSI doorbells */
+#define IOMMU_SNOOP	(1 << 5) /* force DMA to snoop */
+
 /*
  * Where the bus hardware includes a privilege level as part of its access type
  * markings, and certain devices are capable of issuing transactions marked as
@@ -106,6 +108,8 @@ enum iommu_cap {
 					   transactions */
 	IOMMU_CAP_INTR_REMAP,		/* IOMMU supports interrupt isolation */
 	IOMMU_CAP_NOEXEC,		/* IOMMU_NOEXEC flag */
+	IOMMU_CAP_FORCE_SNOOP,		/* IOMMU forces all transactions to
+					   snoop cache */
 };
 
 /* These are the possible reserved region types */

Thanks
Kevin

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
