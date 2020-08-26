Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B168D25340B
	for <lists.iommu@lfdr.de>; Wed, 26 Aug 2020 17:54:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3521085BF2;
	Wed, 26 Aug 2020 15:54:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C2jcjaiurYFV; Wed, 26 Aug 2020 15:54:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3F1EC85A96;
	Wed, 26 Aug 2020 15:54:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 381B9C0051;
	Wed, 26 Aug 2020 15:54:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 40B1BC0051
 for <iommu@lists.linux-foundation.org>; Wed, 26 Aug 2020 15:54:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 3C53D203AC
 for <iommu@lists.linux-foundation.org>; Wed, 26 Aug 2020 15:54:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kSDN3xjuK8WK for <iommu@lists.linux-foundation.org>;
 Wed, 26 Aug 2020 15:54:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2075.outbound.protection.outlook.com [40.107.220.75])
 by silver.osuosl.org (Postfix) with ESMTPS id C2D4C20397
 for <iommu@lists.linux-foundation.org>; Wed, 26 Aug 2020 15:54:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nsTxwI8hYSMntIpmjHCqrFl1RIKSqLy5VMJ80oSdqZTAww+km+AGimMmXzcIOqVzkTLNRBdwDXoEe2dsBcBkzNHOY5QeSafkL3CSW9/hcju38ZOrZQKLFgHBexjmepEqvO0+y2wJwsIJJmEi8v7Yz2hoQKJQjf8G+xAtY20m4fXdvwvXdqzC4UlMBH4cPmwa6yqt6gz/ABoXdz8JYgFI5s292plQbx+FIod/UMbYRcyxAw7T9UY4K7xmU5WhHxE1LHSzniPgOHACxrKFUMvzq37ERPCcC0y5bDl+hVaGuo267tghLmLkyRZ/CjEpO+3fg8edxqGIs3cgUbSLxqAwGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6tQHKdGudG23SIJjjBh+uLES2iq+PgXhlz8izbCKPf4=;
 b=asgjNwkTkwLvNbBdnk6AT+pjCUU4L3fLHAleNTg3fQQoCR0m3xurEBCm2DJcXcQnVfBpJsdQmdLTNpc6JYSNCPzqAWvR+jRgk6G0R5omWiz8XyN9zIk9tCDW6A1wieHHd73iojhp0KZ1f+MUcfYOnMSJtabEEt+Ub99X/OVoQnG+IwqYVu8Q9RK1180DldaEHAYBymITp4dBX7mS4LocCb8ql7pO9UYEQf6eRwZtXKPe4o6qhqTG/kfkGukLvdGjUaU2EuW9/BSghu9QYI++ZLYXyTSpiyFYr/P0ve3PICVwFw1zOOdh4iAcCnbBc9CufJU3QmStfkFyueSAs06YCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6tQHKdGudG23SIJjjBh+uLES2iq+PgXhlz8izbCKPf4=;
 b=VFFFdjmD97NI6MdVA2evm4NW6wc9wn/aDKgclXUEL3wbCfcbQUYW8KNqo7BtDwehTntTYqwoP4NoMoD46NOOMG6fs/78dQboBYctQWmGwfdtxk+cODbRBYpbp4lNf5VcdYLh4idJsIO+MWBWUligQRto6yczjRQU40kfacCTDE4=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from SN1PR12MB2414.namprd12.prod.outlook.com (2603:10b6:802:2e::31)
 by SA0PR12MB4574.namprd12.prod.outlook.com (2603:10b6:806:94::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Wed, 26 Aug
 2020 15:22:03 +0000
Received: from SN1PR12MB2414.namprd12.prod.outlook.com
 ([fe80::d548:1236:cb4f:1be9]) by SN1PR12MB2414.namprd12.prod.outlook.com
 ([fe80::d548:1236:cb4f:1be9%7]) with mapi id 15.20.3305.032; Wed, 26 Aug 2020
 15:22:03 +0000
Subject: Re: [PATCH 0/2] iommu/amd: Fix IOMMUv2 devices when SME is active
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 Joerg Roedel <joro@8bytes.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "Huang, Ray" <ray.huang@amd.com>
References: <20200824105415.21000-1-joro@8bytes.org>
 <MN2PR12MB4488D6B7BBF98845DF796E0BF7540@MN2PR12MB4488.namprd12.prod.outlook.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <34db343f-cd23-09af-3bc5-29b9d385f85d@amd.com>
Date: Wed, 26 Aug 2020 11:22:01 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <MN2PR12MB4488D6B7BBF98845DF796E0BF7540@MN2PR12MB4488.namprd12.prod.outlook.com>
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0042.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::11) To SN1PR12MB2414.namprd12.prod.outlook.com
 (2603:10b6:802:2e::31)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by
 YT1PR01CA0042.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3326.19 via Frontend Transport; Wed, 26 Aug 2020 15:22:02 +0000
X-Originating-IP: [142.116.113.11]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 37f73252-70fe-4f43-b178-08d849d3c900
X-MS-TrafficTypeDiagnostic: SA0PR12MB4574:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4574569FD87929C1ED26302C92540@SA0PR12MB4574.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RdU+IID6MzxhezuvM/Nt8Tldf5B6Ks979awK+dfVt1N7SaDciHkp9cmfT9u6RqOgVTAXGxPSon0jat0kkjVrjEi1MvPwPiCJwOdoIqX18NHSm9tQO0dtamLFBnODh+DwdLASsJZx7yBV6arXoSaGLn6ZxZoFino5I8t4Jh0jj6mfcSTTos0Ovldzko5lw+/GwGSF1QpDZkjX4pYD0i2EwG3BYCNtc2Hab+tApsuvR2PQ+xESLC9k/+FvFHf1tLMSaYcxXtIQo9WQ4ggMPaK/PrATMWpwrbZlXrEBP550b4CVEPnJ2V+ksMA/DRadtW9YUZLmJdZRog/rV9c7kgH200uRt7o7mvaVtyNXRevqBSxHkC1Odb2y4qOELpt+1nth
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN1PR12MB2414.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(366004)(136003)(346002)(396003)(6636002)(110136005)(2906002)(8676002)(86362001)(4326008)(31696002)(478600001)(316002)(6486002)(16576012)(8936002)(2616005)(36756003)(186003)(83380400001)(66476007)(31686004)(66946007)(52116002)(54906003)(5660300002)(26005)(66556008)(44832011)(956004)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: l9sh78XTEvu4Gyy7ZjsQxcoXQ297MchS0ffLybLKoxiN4R3+0KFwnC6t2PvS5/3+5xKCqrbZV4b73dDjGe7Khdc8KK1HA1AVavChiMaSLLhgjJjBkzRMZvqU14bDGOfdM8uofcI1xtz1/3ICNPxaP/3Zv58HRvi3+vynF7uWu9vb2qFJ3PYbpj4+qVAPmGt2vwN1qrxMTk/79HFWikzPvLKBDDY5jzO2v4/I8ucSTsjPX7lro2SBG8+YkICcCqU1J3/PJ4oajHAhaGS3mI/iyGpL72z9mVQylv9d/5mDYqPsHF1NhGDyVrL3vUjwqra0dqI5SNQaA2FBnh82rAyShE9DIgCEY4FsjN3ibOJCROxRgrz4jnnUEWjM85tIajxg0JApFk2DOIAF8JpJ7pI/Or58mgtziktRXsY4WTyAU5QdR5KTWHmWPWnJtgmBD6rdmy2ZYnp8NC8Dprdf0ITk82kcu2lzAPfa9J8XcfU7/OJNKBBF0KuPmSNXf47GfRRx4F28EV3UpjXohw8KVxeuoV+BZPYS6G+nkseEeyguJ4hA6AWYc6WPdCDoxJ/j47EHFMcLY7kpkcNdeLzhmYXGbXm/CMbB05A3lXQK4/vCvdpNO1+plzU87npTUEEWfpmA/JLRUuqmAJquevXth4GjwQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37f73252-70fe-4f43-b178-08d849d3c900
X-MS-Exchange-CrossTenant-AuthSource: SN1PR12MB2414.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2020 15:22:03.4286 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uBj+JI6DJknJRqEHHVFJxhsJZiwZn3aLTflZMEjKK4qYC5HEs+4I+ed6z73NKhqLg7Znt2JvCfWGpv0SxtF5SA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4574
Cc: "Lendacky, Thomas" <Thomas.Lendacky@amd.com>,
 "jroedel@suse.de" <jroedel@suse.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

WytSYXldCgoKVGhhbmtzIGZvciB0aGUgaGVhZHMgdXAuIEN1cnJlbnRseSBLRkQgd29uJ3Qgd29y
ayBvbiBBUFVzIHdoZW4gSU9NTVV2MgppcyBkaXNhYmxlZC4gQnV0IFJheSBpcyB3b3JraW5nIG9u
IGZhbGxiYWNrcyB0aGF0IHdpbGwgYWxsb3cgS0ZEIHRvIHdvcmsKb24gQVBVcyBldmVuIHdpdGhv
dXQgSU9NTVV2Miwgc2ltaWxhciB0byBvdXIgZEdQVXMuIEFsb25nIHdpdGggY2hhbmdlcwppbiBS
T0NtIHVzZXIgbW9kZSwgdGhvc2UgZmFsbGJhY2tzIGFyZSBuZWNlc3NhcnkgZm9yIG1ha2luZyBS
T0NtIG9uIEFQVXMKZ2VuZXJhbGx5IHVzZWZ1bC4KCgpIb3cgY29tbW9uIGlzIFNNRSBvbiB0eXBp
Y2FsIFBDcyBvciBsYXB0b3BzIHRoYXQgd291bGQgdXNlIEFNRCBBUFVzPwoKCkFsZXgsIGRvIHlv
dSBrbm93IGlmIGFueW9uZSBoYXMgdGVzdGVkIGFtZGdwdSBvbiBhbiBBUFUgd2l0aCBTTUUKZW5h
YmxlZD8gSXMgdGhpcyBjb25zaWRlcmVkIHNvbWV0aGluZyB3ZSBzdXBwb3J0PwoKClRoYW5rcywK
wqAgRmVsaXgKCgpBbSAyMDIwLTA4LTI2IHVtIDEwOjE0IGEubS4gc2NocmllYiBEZXVjaGVyLCBB
bGV4YW5kZXI6Cj4KPiBbQU1EIE9mZmljaWFsIFVzZSBPbmx5IC0gSW50ZXJuYWwgRGlzdHJpYnV0
aW9uIE9ubHldCj4KPgo+ICsgRmVsaXgKPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAqRnJvbToqIEpvZXJn
IFJvZWRlbCA8am9yb0A4Ynl0ZXMub3JnPgo+ICpTZW50OiogTW9uZGF5LCBBdWd1c3QgMjQsIDIw
MjAgNjo1NCBBTQo+ICpUbzoqIGlvbW11QGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnIDxpb21t
dUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZz4KPiAqQ2M6KiBKb2VyZyBSb2VkZWwgPGpvcm9A
OGJ5dGVzLm9yZz47IGpyb2VkZWxAc3VzZS5kZQo+IDxqcm9lZGVsQHN1c2UuZGU+OyBMZW5kYWNr
eSwgVGhvbWFzIDxUaG9tYXMuTGVuZGFja3lAYW1kLmNvbT47Cj4gU3V0aGlrdWxwYW5pdCwgU3Vy
YXZlZSA8U3VyYXZlZS5TdXRoaWt1bHBhbml0QGFtZC5jb20+OyBEZXVjaGVyLAo+IEFsZXhhbmRl
ciA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT47IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5v
cmcKPiA8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz4KPiAqU3ViamVjdDoqIFtQQVRDSCAw
LzJdIGlvbW11L2FtZDogRml4IElPTU1VdjIgZGV2aWNlcyB3aGVuIFNNRSBpcyBhY3RpdmUKPiDC
oAo+IEZyb206IEpvZXJnIFJvZWRlbCA8anJvZWRlbEBzdXNlLmRlPgo+Cj4gSGksCj4KPiBTb21l
IElPTU1VdjIgY2FwYWJsZSBkZXZpY2VzIGRvIG5vdCB3b3JrIGNvcnJlY3RseSB3aGVuIFNNRSBp
cwo+IGFjdGl2ZSwgYmVjYXVzZSB0aGVpciBETUEgbWFzayBkb2VzIG5vdCBpbmNsdWRlIHRoZSBl
bmNyeXB0aW9uIGJpdCwgc28KPiB0aGF0IHRoZXkgY2FuIG5vdCBETUEgdG8gZW5jcnlwdGVkIG1l
bW9yeSBkaXJlY3RseS4KPgo+IFRoZSBJT01NVSBjYW4ganVtcCBpbiBoZXJlLCBidXQgdGhlIEFN
RCBJT01NVSBkcml2ZXIgcHV0cyBJT01NVXYyCj4gY2FwYWJsZSBkZXZpY2VzIGludG8gYW4gaWRl
bnRpdHkgbWFwcGVkIGRvbWFpbi4gRml4IHRoYXQgYnkgbm90Cj4gZm9yY2luZyBhbiBpZGVudGl0
eSBtYXBwZWQgZG9tYWluIG9uIGRldmljZXMgd2hlbiBTTUUgaXMgYWN0aXZlIGFuZAo+IGZvcmJp
ZCB1c2luZyB0aGVpciBJT01NVXYyIGZ1bmN0aW9uYWxpdHkuCj4KPiBQbGVhc2UgcmV2aWV3Lgo+
Cj4gVGhhbmtzLAo+Cj4gwqDCoMKgwqDCoMKgwqAgSm9lcmcKPgo+IEpvZXJnIFJvZWRlbCAoMik6
Cj4gwqAgaW9tbXUvYW1kOiBEbyBub3QgZm9yY2UgZGlyZWN0IG1hcHBpbmcgd2hlbiBTTUUgaXMg
YWN0aXZlCj4gwqAgaW9tbXUvYW1kOiBEbyBub3QgdXNlIElPTU1VdjIgZnVuY3Rpb25hbGl0eSB3
aGVuIFNNRSBpcyBhY3RpdmUKPgo+IMKgZHJpdmVycy9pb21tdS9hbWQvaW9tbXUuY8KgwqDCoCB8
IDcgKysrKysrLQo+IMKgZHJpdmVycy9pb21tdS9hbWQvaW9tbXVfdjIuYyB8IDcgKysrKysrKwo+
IMKgMiBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiAt
LSAKPiAyLjI4LjAKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwppb21tdSBtYWlsaW5nIGxpc3QKaW9tbXVAbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcK
aHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vaW9tbXU=
