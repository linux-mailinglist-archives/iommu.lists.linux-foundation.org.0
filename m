Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C35562D92
	for <lists.iommu@lfdr.de>; Fri,  1 Jul 2022 10:15:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D259A41716;
	Fri,  1 Jul 2022 08:15:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D259A41716
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QLAzlhmo
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UVm1Gs72jK5Q; Fri,  1 Jul 2022 08:15:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 62BD5416F3;
	Fri,  1 Jul 2022 08:15:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62BD5416F3
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2E7DDC0036;
	Fri,  1 Jul 2022 08:15:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C6844C002D
 for <iommu@lists.linux-foundation.org>; Fri,  1 Jul 2022 08:15:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8AE718456F
 for <iommu@lists.linux-foundation.org>; Fri,  1 Jul 2022 08:15:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8AE718456F
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.a=rsa-sha256 header.s=Intel header.b=QLAzlhmo
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id onIHeACyJwZb for <iommu@lists.linux-foundation.org>;
 Fri,  1 Jul 2022 08:15:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5CAC783F02
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5CAC783F02
 for <iommu@lists.linux-foundation.org>; Fri,  1 Jul 2022 08:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656663349; x=1688199349;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8gnp1JQo42uX6AI+n90mcsRyUxR6za8mgtn/rw8tp5M=;
 b=QLAzlhmoUe++8cYh2qCdiTS5RmlsOPHcfNuv14E/lG91L+xhkUqY/SpQ
 kHLw3Bn+N96qvqc4AYHQXdruM8xIP/0EEXWGMUQrp3jIX0itvbUiqMwPi
 l0kt+j0vfBfd8EkJBxMcwzl6HHEjPW6zTW4e0ueAGlQgJBZrr+n87zPK3
 GJMKPpWTAVfgwMhIYPdhMH4aW10GxElve+VhWYt4nzyCQ7KpQyEHcGZ5A
 P6t3tB1ZxzKOS0GhEV9CtIq8TLHZCbLsAJI5Ar/x53cklr6gFmkAVoBnI
 T7Wo3zLr3w1mFjhMd2WXhIhwQeIFQGr6io/7IekD1m0RDjKVyBZXkDtwA A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10394"; a="346574992"
X-IronPort-AV: E=Sophos;i="5.92,236,1650956400"; d="scan'208";a="346574992"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2022 01:15:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,236,1650956400"; d="scan'208";a="768422101"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP; 01 Jul 2022 01:15:48 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 1 Jul 2022 01:15:48 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 1 Jul 2022 01:15:48 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 1 Jul 2022 01:15:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jV9q0hgvwpJZ10M/8LhFaNRs8cynjyCiVC7ggcB768heagobmgt/Rj8qUyoBw5dMqCUH49nBXDRONSgHuvM6jMlw6qhsMUMtwDV9qAWERQGHmEnTvWI1k/y1TolqcO5RjsaJGEvWGkj2mVjLo18LIfIRVmFmQPr68YsZRy1/8NRiokqFHKSaJHJNf3m2edLulmPQDOmrHL95RmCgn0aunG4g8wUX47ovKEERDmNFd/Fnul5VT/Pixcpf4SvV6qvAelZg4CajEE5tEEpheOp9ZQH1+hqC/MJZNJCqVcNBvqOUzeHp1z3pAvMDh9L+sBZnKJptIHHgUhC+fhBlWHoBrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JYdozj6yf3i3bdz14TYy6p5S7J49uyTDPbt6xuxiQ7U=;
 b=YkUCSIEXMJYB6lzNX8WBAfI7muXo8ucRfRf64KmShKL7q01WcOPrqJYzcfPiZojadeLA1Vj3CW6hoPim2e+w/yQ8CHjqQM7/A8wIU3VZqmtpnA8RLup2+ARtVo4W3AGF+0uMq/IYjIQoLe8Fv5FVxUcN3EQWxXPMX9lHcvN5MdDqnm7DDLDz7vyoQ6muoloE9KlqsPQra9D/oBJPOnFDd85MZT8JA1QHve+sCVYUkb/RHQvv+RfBv70W1PXAhzDmNJ4ggtyeDiWH16nErrXR9jZk0KoaCMGN5u+Rkjc0tPtFbJ4q15Wi7dd8MtxEqDRmxWBrOU1xp/elhK+I4CSOUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by BYAPR11MB2631.namprd11.prod.outlook.com (2603:10b6:a02:be::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Fri, 1 Jul
 2022 08:15:46 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::8435:5a99:1e28:b38c]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::8435:5a99:1e28:b38c%2]) with mapi id 15.20.5395.015; Fri, 1 Jul 2022
 08:15:46 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Lu Baolu <baolu.lu@linux.intel.com>, "iommu@lists.linux-foundation.org"
 <iommu@lists.linux-foundation.org>, "iommu@lists.linux.dev"
 <iommu@lists.linux.dev>
Subject: RE: [PATCH v3 10/11] iommu/vt-d: Use device_domain_lock accurately
Thread-Topic: [PATCH v3 10/11] iommu/vt-d: Use device_domain_lock accurately
Thread-Index: AQHYi40sMMfWvFTUxkmVK9oQLWZN+a1pLhxQ
Date: Fri, 1 Jul 2022 08:15:45 +0000
Message-ID: <BN9PR11MB52763F336B2535BC89E2C7498CBD9@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220629074725.2331441-1-baolu.lu@linux.intel.com>
 <20220629074725.2331441-11-baolu.lu@linux.intel.com>
In-Reply-To: <20220629074725.2331441-11-baolu.lu@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4f30ff78-5354-4845-8f02-08da5b39e63c
x-ms-traffictypediagnostic: BYAPR11MB2631:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: go0CAvuiip8aBwh2hmn9gxmuCpVeAoOc/shtLwhFxKpKubonmI0qJUT10omNgqUqnuxjIDTEpLwO13qW/pef5ACrDTIKFhZpWuJLi5Rxm0ptE7/qWVbwaZEJOOHRlgbKoNTagWVQgwajz7Txyf9KjLtbj9CfX/0IrRy+LNQLOTvFpwitJp7P93H4Z/39OeVwtFY4WtxEqMO9VhN+LpdF7wu1wP2yE9domon2foawWeJsfpIXqYbJy/UcWOcD+oawPwdRn/bKjuykGZJVPd+cS8bNf7QRRo6oR4GD+tuYdDWGvOqKp9fUxRxWv+Ufq+MsLDuMZZE1HFEONXWxYNpeCjWV7Xo2jvxeJDX4dSZscoW3FXxc/r1jIWuhEv7hTCNs/8qpIo26RNrlal0/r60EFIJffjCvPD5a5tizW73w7oey3OPZw9uzzWVT2CWuAOmpeIIXutQ0P/Vhe+rXyaeM+dxpNlRD3cLM36SuozqiQ4vSl4abUw98TGX4ZT7mU75XA99icKm2rrMAUSi6lv2pL0MjdDhp5WtosBervmd8HA8d5XkWs/+GI7LJ9cc9GjL8MdhSQZqvvIGuIsAnMvLO8lWxxW1MpooLGaR9eB3WlNbjtyfz2SbzYZgkXxRHehSX9q/H7CfmgO8TQW98mr/7z4haXv9v67Dz3XXW3XjbBsRS9ZRlDYR1JkM01mzN9E+/fHWZfC88/UzHm4rZRuTVLROtB6P42BgNLFq2Uao+C7rkTD0E/N/qQr6pMnmCnRXD/K9gvO0NqYJnRk3NZMhjbAsO9F/G7RYal3dm+aAEaa1VKu6RH6U2gxoBjbXwe3hW
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(376002)(396003)(39860400002)(366004)(346002)(38070700005)(55016003)(4744005)(122000001)(66946007)(64756008)(8936002)(9686003)(7696005)(82960400001)(6506007)(83380400001)(66556008)(52536014)(26005)(66446008)(41300700001)(76116006)(38100700002)(66476007)(2906002)(478600001)(110136005)(316002)(71200400001)(186003)(5660300002)(54906003)(33656002)(8676002)(4326008)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Zfi4ZdOOdZxnU77CANKSGTKlkgoi48wm0jes2jgZjTO/rKQAWBoevmpqgI35?=
 =?us-ascii?Q?EhUQEHGqsNOpDigHvRoJYpC72PiTVIkNSPWUscYrFi9Pk1qwb4Dm2A6Qj73D?=
 =?us-ascii?Q?vTBvfMMGM5SC3XR6YC8jBBa7QHiz7s2e/AHpRmrKW10Kz6gz9l8TahQNn0/B?=
 =?us-ascii?Q?L3jdgQ3dhC8kc2j4P/HSGuqWj9YY/tQyl8sTi6EAznlHnftLqsIq+pjhaX4v?=
 =?us-ascii?Q?wdhnLg42wSNht46XiySZvByj2k4Rr3TL4qztLprWvbiOGWjKIJ0AIs7dRNci?=
 =?us-ascii?Q?l1XP0/vR4kPlWyHw6gfihbzeyRJQJ029L9gevT2FMfRKeC57b/lwu80PcjQ7?=
 =?us-ascii?Q?fgd11LbPGBR1zuDcQeaWvQ+9tZ4Fn8fS8WZEA7Ywdps87RO/i9l8XEtaaUWS?=
 =?us-ascii?Q?BXJq/B3bCIhvc04PBXSmM7gJxln7V6j/6Y/WTeK42LoLs8kiOMOinhNaYCer?=
 =?us-ascii?Q?FkNYvM+QaoMwvwzyQruggOMzMuWEKOBj7Zwf9UY3/+m78gjbLW6PM+g5EfPU?=
 =?us-ascii?Q?l8Ue+TN7DDSRU1+v/KHyaFERMpa06IBlZxmkbfZc64GVP+VLylhjuCMAIGUq?=
 =?us-ascii?Q?HaC9cwESCxxjL2Rf5WIfxWr76ejOFCSuolrxgvRdYPxi90ZgpvtMiXdzasdP?=
 =?us-ascii?Q?LDXK703oQdhwdHgH2IW7kVLO1XUes09sPS8YvTKH49bVpuHHz4B+LNSZNxlw?=
 =?us-ascii?Q?i7NX2d5Uo9yy/8G/F30KC5lZ7CMiZ2evwBzMnm/mR0IESuxWznvSQA38NxXI?=
 =?us-ascii?Q?iSWv1hTT1AvNKGleq6n3tJVZuLZ9Copnjr+PCR9G4qyB58oGVSmd+hYaRsW1?=
 =?us-ascii?Q?/U3ruG/h+WuzBUiHUEkY+RgriyRr/agpo8oZZaCiyl0Fu+UJip2m6DkYSUdW?=
 =?us-ascii?Q?UXOUfbwTQALgIo/DWDJU65zdkfxdqlwd1+dv1woFLJgZ3jC8rFssfVp14fBa?=
 =?us-ascii?Q?86uwPanY94vEbe2AqIJ302q+CFdCcG0ZfVf9eeoOK+JI2NAHGY2D2E3Y2knz?=
 =?us-ascii?Q?Tk7xLW57TRNqJv07UabISaMmIPpYVMh4ThTKvd+B73CbAELGHxIapHXGEl2v?=
 =?us-ascii?Q?yTvkRh7HIqvEmGynN33hh2/JEHajNnJeeu6WFW0Zsqfz+w2ZRTF6mFs0mCBM?=
 =?us-ascii?Q?fMxD8iMoJT0VRBLXhjXNOb7c44+44MmKVuGtBApKxkzJljGXqMBG1SnyzoXW?=
 =?us-ascii?Q?WyGP9TxSGcdthpaAfDh587Cgc38p2KlZYhEGISNNrExYUWBtlEmtOuaAaDkt?=
 =?us-ascii?Q?9TTlMsoG6UeMnGsiE9+lRa3MNdDqnzV6MVCsScnddHw6sZ4Op9TKMh/dgnxr?=
 =?us-ascii?Q?cDz02mYrS9jONJ6goYcpWtBmC6TpOwY4J1LZDKXhDa49OLz9z0EUfnXxNzw1?=
 =?us-ascii?Q?0WLuGanNwuiYmA6LwCzjSU5GIHFQJ/i2DWMTz8oUGXczSMdvpQIO4gf+Ize7?=
 =?us-ascii?Q?kcvE0fFcVE2UlvzcwbTxygNrTxYdENkSfZURzMMWW1lJSRyiAJtAVHy7eVlB?=
 =?us-ascii?Q?lwv3zEa2eYMixhgcFWF0zmWzeNa+utVCVucOvfiG3i10j9MkMmWQG9ee7iqx?=
 =?us-ascii?Q?0VuKfXHmXdvkOolkI/XWkIl/0k9UIi0uKxYFZOcc?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f30ff78-5354-4845-8f02-08da5b39e63c
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2022 08:15:45.9714 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5oHqO7oEF+uGTdrFlCU/+43GXkdV5xEvMeAafQdhDtE+KU6mzPAyxO/4asku+X5f92Jd3zR6scgtJzAlNuColA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2631
X-OriginatorOrg: intel.com
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Raj,
 Ashok" <ashok.raj@intel.com>, "Pan, Jacob jun" <jacob.jun.pan@intel.com>
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

> From: Lu Baolu <baolu.lu@linux.intel.com>
> Sent: Wednesday, June 29, 2022 3:47 PM
> 
> +	spin_lock_irqsave(&device_domain_lock, flags);
>  	list_for_each_entry(info, &domain->devices, link) {
> -		if (!info->dev)
> -			continue;
> -

suppose you can replace all spin_lock_irqsave() with spin_lock()
in patch5 instead of leaving some replacement to next patch.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
