Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBCA4736BE
	for <lists.iommu@lfdr.de>; Mon, 13 Dec 2021 22:51:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D463360B30;
	Mon, 13 Dec 2021 21:51:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hJp3UVPNvpim; Mon, 13 Dec 2021 21:51:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id E64A660B49;
	Mon, 13 Dec 2021 21:51:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ABA01C0070;
	Mon, 13 Dec 2021 21:51:42 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D66C9C0012
 for <iommu@lists.linux-foundation.org>; Mon, 13 Dec 2021 21:51:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BDC68812B5
 for <iommu@lists.linux-foundation.org>; Mon, 13 Dec 2021 21:51:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=nvidia.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d3NvTKogfFne for <iommu@lists.linux-foundation.org>;
 Mon, 13 Dec 2021 21:51:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on20615.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8c::615])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5DBF8812B2
 for <iommu@lists.linux-foundation.org>; Mon, 13 Dec 2021 21:51:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gKglpUtcgZryM3e6Gnqqo7geEpD+djC5MuYH87lbgyn+hl/YCA+eVeC21+pXb3P6e/2mDGLVw7Kd3qisquahu9gm0RKw3bKVdQJEWf1UcJVyIlkfwFNsS4MLXuXpaF/mWEeoZ3fPMJDaKorpT8AGuFuLyahW+RlGSRPzD/Y64+/Oo1OeBdFou9bfpWb2kfvZfWRwM7bcDQR8AAaig0LTEBgPA9kAti3/uCVaRjEhxyHnekD4EPjXNjHS63jSXYcuxtIcKYittZE3p0qL8iiEVjLTl4bWAZG44SLWlORCCzIfM8jPqNuYyKXc/6qU8alojanTv9UpmDa02oFq4EZ+DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6a2aB62WxtTOcuuMDz/C4I5tampE+477S+/Ju5h2HpE=;
 b=nzSsrm2TMIqTbY7BNRAnpH6a5/RHZVxw2x2ahZ0ve4DwvaeHTHRDS9DvcsxjeIAZ8KKvur6UfoYqGjdXlBAl3kCNMbLwLDbXLU4rFEw5AdBZgzEykcBWHL1pMGGU8n5LWMPooPVSJ4zn6paWMCuqEVWCdJFHZgvRQKSILNLe88U2AdtJopSMQKMHnh+hqacbcdtDDRG31HlXTwHjOgASdwsmOOV7jRRCpzep+BuQChtTtkTpoQtCI2MRjBVXxf1CEAWea3otiEHo3aj7kS0+zt63bIR7WYVGBsEFt5Xx9UrhfwvPiyXoKoo3mfRfkDiNl6gbJWVTG+BmaAnt+eOzzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6a2aB62WxtTOcuuMDz/C4I5tampE+477S+/Ju5h2HpE=;
 b=Mk+/cKSCy/xBgbJPzXODHzkYDLTmSw1eNjFZVxHMUPdp2cmqJrLG+W4dkxrrlZ22ZNsScRI+oAfRJ5Vqqj0MukJzRpK4AW9RdICjUIFPmkCCVdJrhsjvs+oV+cSgA8wftXm53An4a7cCRTUOae5Z98xeSIL33aAvbt86BoOD41EfjixVdXDJmmFZHvzoJhgOoKk0dwV8aI6ao3lDFPlWwCwv4VSLRC8Aa6UeMTvwu1lX0NmACyKq8Uq6uP6KFB35NCVY4PoKxM0EXm6P2nXHd02kLWMtX7qd+Yqjw7FofuMzAB7cbQOvp0L9DX5ZUO/kCeIvT1JjZcpMXIZIl8k5RQ==
Received: from MWHPR12MB1264.namprd12.prod.outlook.com (2603:10b6:300:d::16)
 by MWHPR12MB1920.namprd12.prod.outlook.com (2603:10b6:300:10e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Mon, 13 Dec
 2021 21:51:36 +0000
Received: from MW2PR12MB4667.namprd12.prod.outlook.com (2603:10b6:302:12::28)
 by MWHPR12MB1264.namprd12.prod.outlook.com (2603:10b6:300:d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.15; Mon, 13 Dec
 2021 21:51:36 +0000
Received: from MW2PR12MB4667.namprd12.prod.outlook.com
 ([fe80::6df1:639d:74ea:d39e]) by MW2PR12MB4667.namprd12.prod.outlook.com
 ([fe80::6df1:639d:74ea:d39e%7]) with mapi id 15.20.4778.017; Mon, 13 Dec 2021
 21:51:36 +0000
To: Logan Gunthorpe <logang@deltatee.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-nvme@lists.infradead.org"
 <linux-nvme@lists.infradead.org>, "linux-block@vger.kernel.org"
 <linux-block@vger.kernel.org>, "linux-pci@vger.kernel.org"
 <linux-pci@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>
Subject: Re: [PATCH v4 01/23] lib/scatterlist: cleanup macros into static
 inline functions
Thread-Topic: [PATCH v4 01/23] lib/scatterlist: cleanup macros into static
 inline functions
Thread-Index: AQHX3AeSfN3bingHxU6tBzBEGrCeE6wxHyKA
Date: Mon, 13 Dec 2021 21:51:35 +0000
Message-ID: <9076b4cc-884a-ad15-90ad-b43ca55e20c5@nvidia.com>
References: <20211117215410.3695-1-logang@deltatee.com>
 <20211117215410.3695-2-logang@deltatee.com>
In-Reply-To: <20211117215410.3695-2-logang@deltatee.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 577f10b5-bf37-4890-3763-08d9be82bc20
x-ms-traffictypediagnostic: MWHPR12MB1264:EE_|MWHPR12MB1920:EE_
x-microsoft-antispam-prvs: <MWHPR12MB1264EE0CC90E0FA5618DDF16A3749@MWHPR12MB1264.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eYpRD2mXaH3uOZgK4i0voPg4oukIMeemuVAu2yKywuia+PGDRH9zjnLY/LPQS2Vu56Et09we5MUB3zGyMl++TNlGcbDREf6dqnQI0NQN9C+MS8yfxQDZTJ1d5CNglz9Ju2PZFFR3dFFJ+p7RA5zzdTqyF6pG8dxkhUQ2YvBSC5fi/A2GEPnugAaCGDc95uj+xdcjBnaiYsi5moxT5la3DxUhqY+MyF5EZvqJAnKE3FMebQx5oaoUmFiqzKI3rNE5aFMyptN5IwKyvh2UayjizHAISA/5GLXU8m3ty2ll7WlujcKQssx+jmVw80lmB6BpM0p0Kp/UEeg8KPy2lbVGoO52V4/tguWOAT3C/Yz8CVszTNtUWDIqvdud3FtUwWMGCikEo0ZFV74+yzFSysJnxjtBL7BibJmmcsCLX40AY0VlQgY4tL2LUjr+g7rAixu17WGQZw6Q+j+249ykjciu8ro7M0TmRYCGvfAjlYzg8S5pRB6bKausPGp2Gb/3GYFLFOGmut/XdODtngoKUlGR9clUrqoxnUCVNm18+nCNCQbSexgWze2D6vVhvMq+2uFN8wsxAPsin+7bciR2xf+P0QkV+wF3u2Mui3hB1vjVhLJQGuBb180nYHSpIYCVmSrTHIJK7JO3RFDs5l3lUf5wUafsHLUmJuwiSrC5/c/EXuxKP0su3kCH6LiHwin/uDg9PmRO6jhLVE4yXUQ+1FeGa+ld5AaIUjDPgdoVk5xaHnwnQx6QL/SAof9N4KOCoRedwZV5QwqSMg4xhHE0hjSBgg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR12MB1264.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6512007)(2906002)(186003)(316002)(7416002)(31696002)(31686004)(4326008)(4744005)(71200400001)(86362001)(53546011)(508600001)(8936002)(122000001)(110136005)(8676002)(38070700005)(66556008)(66446008)(76116006)(66476007)(64756008)(6486002)(38100700002)(107886003)(5660300002)(2616005)(54906003)(36756003)(91956017)(6506007)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UjZGa24zeE1TaTd6ZWt1Tml6RGZTMGFIQkw5Vy9lTGMzVmU2MGUvTWovbzZm?=
 =?utf-8?B?Zmd0ZFo4bFE2U0tybGp3R0xTMGd4dHNHTlJqbkFmMEFSbDMyRUdpeHhJNTl3?=
 =?utf-8?B?azJ2dmlOUDJCekY1Unc0NjdWZGxyZGpIMm00d0krdjZRSzlxTmlnV203ampv?=
 =?utf-8?B?Y0VMRTJVYkFjaWNYY2lOaTVZT2NuNW1wRXk0bUVZQmFXVEFjTFQxc2RwWEdl?=
 =?utf-8?B?Wnlsa2lydkZhMzhZSis0SkoyZ2tONmhrd3ZiWGNNT0VJaHIvelBleXF1a0NF?=
 =?utf-8?B?Uk5zTXQzckp3alpZaS85ZVFmaVoxVjF3cFcrcjZXUDk1Q0RaK21xNGJQN2Nj?=
 =?utf-8?B?ZXQydXJnR1lMV2pZYW9PS0c3SUt5L1dtR2FPOW9oMHJiWnAxUm9QVCtPalgz?=
 =?utf-8?B?RnlIeG05blpwcEdtYXkyd2g1WFo3My9UR3ZFWlpqQWhvRndZY1JkL2ViOTA4?=
 =?utf-8?B?dVRDWjVjKzB6MDRhQ254cXBjVmJyTW1JWk0zT3Q2UGNQN3N2OXlLOHB1RTFt?=
 =?utf-8?B?UFdjL2tOL2luUm9LbGp1SnNNL2k1NXRENml3RjREbTAxRHY1SGljRHl4anNR?=
 =?utf-8?B?a25ZZnFZUnFTSTFQeVlwN1FpNXFIQ2ZycjRJc1k3TjYvdGExS01sWGhGWVBj?=
 =?utf-8?B?SEtCaEc1cWorbm5IaXdwMVFkcXVEL2paU2lJRDdIY1g2dFBiTnQxem41K0ZK?=
 =?utf-8?B?aEV4OHlWQlBQMHIvSnJNRW1HNU4wNGRHZ2lWRG5vMytHSFZzS0F4WklzcmZS?=
 =?utf-8?B?OENrVmFjb1A1UytYeCtHTk9DZDFUaVQxQ0FIUzNNaTNhb1FQL1hLK1dOV3ls?=
 =?utf-8?B?d1RhWmVtUjVCMENsUmFHNkUyanlmeUs3ZmQ0blNVS3hISjRHc2w2bTVLVzJG?=
 =?utf-8?B?czBXNVFpbmJsSXA2bUplVmxxMUdZUXFuRU9mTmltYVF2MHcyYzZuV3N1VDRh?=
 =?utf-8?B?ak9MRVlWVFlwaWZiYzB6UTZOS0JCUDE1YkhFeVE3ckVtUHllTFNHbnphWEpL?=
 =?utf-8?B?ejFqN24wNnZNcjVSdjUvY3hrNGVFS1N5TVlHcWJqa3VOdlBWNHpocmNPZ3Fs?=
 =?utf-8?B?YWV2L292V2hxalN3NTM0NlpQV1NDbWNPV0FpOXRGemVmTzlWN2xhYWZmKzMr?=
 =?utf-8?B?UHBXTjNGV1JlQ0JMSi9iOEg0U2V3OFNSMUtYcVdsdnF3V0theGZlLzMvNks1?=
 =?utf-8?B?M0o5VkpBMU5XZGh5UzJwNVVWZ2dqZEh4RGN3Wk5ub2dWMUNMQndXU1Npc1g5?=
 =?utf-8?B?Z0ZnUGdTS3dYcHNzR2dXV2ZmTzRKNzZoMVo2V21IYzdQZmR1RmQ4eDJFaWJ5?=
 =?utf-8?B?U0JBQk5yZlBCV0ZLZmRYRllHNXZpeFhQcVNYUkprS3VHS2xQZ1ZJdjRCZEVW?=
 =?utf-8?B?bFdEQ2RralV0WlcwZllJanB4UXdmSVJzS0t5V1MrOVVLMkJ4WUhKR1VYUDFO?=
 =?utf-8?B?L2pGbFNmWWxwc0l0ZExxYUdUMk5VcUViZ3Z2cXlFZUdFcGtpSFhKd3BzZHpT?=
 =?utf-8?B?QW5WRkZxOFJZVWg5eWxETzZJeXlKQVdIRGltOUFNYVRzVkZJQXkxcENQTzMr?=
 =?utf-8?B?SEFnTXQ5VEtNZkVGalg2WTVJTFVnYis3VWJ6dFBSUDVGQjFNOGpVVWlqTmNQ?=
 =?utf-8?B?L2ppUTEzZkNLOFZzK2tzam8zTm4xeUlkTmQvN1kxdFRFOElQMHVEWlhobGNF?=
 =?utf-8?B?ejYrUFJKYlZ4N3E4WlZJckI4OWJqOC95MDQxNlJOZDNjWlJGVkxBcXpPTjJm?=
 =?utf-8?B?WGhuZXc2WUE4azFrUHFRREhLYXBYYkd1eE5ZejluTGZUOFNpcnN4Y1NlWk9q?=
 =?utf-8?B?R01sM29LME5KbEZXMm9IWUhCcDcrNm5KT2pmcURZOGdLcktuR2ZoWHFWZnJQ?=
 =?utf-8?B?Z2ljaGU0U2ZxMG9ocEZhN09RakNidWdXQThacWlqeEgwSVFQcUcyYzV6VlNZ?=
 =?utf-8?B?TnZ6NWU1R2JlMTBkOFFDTlc5V3Eyd2d2aVVLMlFLOEFVQzN6Wm43QjBiWW5a?=
 =?utf-8?B?WEZZWmw4NzE4cXFKWG1uTUszQ054S1dxLzZ6TmlpNzY0aXozcGE4cHl0RVUv?=
 =?utf-8?B?TUo3d1pESWtSUEczUy8zano5TlNPeDh1Tit0cWZRT2h2VXZQbktEelg0M3pX?=
 =?utf-8?B?ZzlSSXA4cTk3ME5BUjN2bTVRRXRYVEVQOW5FZFkwdGk2ZU1EeTBodnV0Yldm?=
 =?utf-8?Q?0W9CB0cmlXu4vPdBCV/VhJfFJ/svu83qw1fnoYQyQq7N?=
Content-ID: <ECBFF3906609C34195BEAD61D224BDA3@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW2PR12MB4667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 577f10b5-bf37-4890-3763-08d9be82bc20
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2021 21:51:35.8281 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ylW3AIkRoU+4uufBP0GFdIc+ZU9cWVKvmCBk069xXOU13wcV+qjX59+qW+5KHQD7puvs+v/Qb3p/WKEbSavMhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1920
Cc: Minturn Dave B <dave.b.minturn@intel.com>,
 Martin Oliveira <martin.oliveira@eideticom.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Ira Weiny <ira.weiny@intel.com>,
 John Hubbard <jhubbard@nvidia.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 Robin Murphy <robin.murphy@arm.com>, Matthew Wilcox <willy@infradead.org>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Chaitanya Kulkarni <ckulkarnilinux@gmail.com>,
 Jason Ekstrand <jason@jlekstrand.net>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Bjorn Helgaas <helgaas@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Stephen Bates <sbates@raithlin.com>,
 Jakowski Andrzej <andrzej.jakowski@intel.com>, Christoph Hellwig <hch@lst.de>,
 Xiong Jianxin <jianxin.xiong@intel.com>
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
From: Chaitanya Kulkarni via iommu <iommu@lists.linux-foundation.org>
Reply-To: Chaitanya Kulkarni <chaitanyak@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 11/17/21 1:53 PM, Logan Gunthorpe wrote:
> Convert the sg_is_chain(), sg_is_last() and sg_chain_ptr() macros
> into static inline functions. There's no reason for these to be macros
> and static inline are generally preferred these days.
> 
> Also introduce the SG_PAGE_LINK_MASK define so the P2PDMA work, which is
> adding another bit to this mask, can do so more easily.
> 
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
> ---

Looks good.

Reviewed-by: Chaitanya Kulkarni <kch@nvidia.com>



_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
