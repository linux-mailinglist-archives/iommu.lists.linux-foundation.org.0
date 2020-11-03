Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DEC82A3B19
	for <lists.iommu@lfdr.de>; Tue,  3 Nov 2020 04:43:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0F0FF86BD9;
	Tue,  3 Nov 2020 03:43:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VfmxZmrAzNyY; Tue,  3 Nov 2020 03:43:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 804F086BC6;
	Tue,  3 Nov 2020 03:43:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5E4DBC0051;
	Tue,  3 Nov 2020 03:43:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7756CC0051
 for <iommu@lists.linux-foundation.org>; Tue,  3 Nov 2020 03:00:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 62F5D86B0B
 for <iommu@lists.linux-foundation.org>; Tue,  3 Nov 2020 03:00:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PY-No-ch76SY for <iommu@lists.linux-foundation.org>;
 Tue,  3 Nov 2020 03:00:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by whitealder.osuosl.org (Postfix) with ESMTPS id CB2D286A4D
 for <iommu@lists.linux-foundation.org>; Tue,  3 Nov 2020 03:00:42 +0000 (UTC)
Received: from DGGEMM406-HUB.china.huawei.com (unknown [172.30.72.57])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4CQF041r70z50rc;
 Tue,  3 Nov 2020 11:00:36 +0800 (CST)
Received: from dggema765-chm.china.huawei.com (10.1.198.207) by
 DGGEMM406-HUB.china.huawei.com (10.3.20.214) with Microsoft SMTP Server (TLS)
 id 14.3.487.0; Tue, 3 Nov 2020 11:00:38 +0800
Received: from [10.174.185.137] (10.174.185.137) by
 dggema765-chm.china.huawei.com (10.1.198.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Tue, 3 Nov 2020 11:00:38 +0800
From: Kunkun Jiang <jiangkunkun@huawei.com>
Subject: Some questions about arm_lpae_install_table
To: <robin.murphy@arm.com>, <iommu@lists.linux-foundation.org>, Will Deacon
 <will@kernel.org>
Message-ID: <6778678e-df81-f7e2-235d-6390ff6384ac@huawei.com>
Date: Tue, 3 Nov 2020 11:00:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
Content-Language: en-US
X-Originating-IP: [10.174.185.137]
X-ClientProxiedBy: dggeme713-chm.china.huawei.com (10.1.199.109) To
 dggema765-chm.china.huawei.com (10.1.198.207)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 03 Nov 2020 03:43:05 +0000
Cc: wanghaibin.wang@huawei.com, zhukeqian1@huawei.com
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

SGkgUm9iaW4sCgpSZWNlbnRseSwgSSBoYXZlIHJlYWQgYW5kIGxlYXJuZWQgdGhlIGNvZGUgcmVs
YXRlZCB0byBpby1wZ3RhYmxlLWFybS5jLiAKVGhlcmUKYXJlIHR3byBxdWVzdGlvbiBvbiBhcm1f
bHBhZV9pbnN0YWxsX3RhYmxlLgoKMeOAgXRoZSBmaXJzdAoKPiBzdGF0aWMgYXJtX2xwYWVfaW9w
dGUgYXJtX2xwYWVfaW5zdGFsbF90YWJsZShhcm1fbHBhZV9pb3B0ZSAqdGFibGUsCj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBhcm1fbHBhZV9pb3B0ZSAqcHRlcCwKPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGFybV9scGFlX2lvcHRlIGN1cnIsCj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgaW9fcGd0YWJsZV9jZmcgKmNmZykKPiB7Cj4g
wqDCoMKgwqDCoMKgwqAgYXJtX2xwYWVfaW9wdGUgb2xkLCBuZXc7Cj4KPiDCoMKgwqDCoMKgwqDC
oCBuZXcgPSBfX3BhKHRhYmxlKSB8IEFSTV9MUEFFX1BURV9UWVBFX1RBQkxFOwo+IMKgwqDCoMKg
wqDCoMKgIGlmIChjZmctPnF1aXJrcyAmIElPX1BHVEFCTEVfUVVJUktfQVJNX05TKQo+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBuZXcgfD0gQVJNX0xQQUVfUFRFX05TVEFCTEU7Cj4K
PiDCoMKgwqDCoMKgwqAgLyoKPiDCoMKgwqDCoMKgwqDCoMKgICogRW5zdXJlIHRoZSB0YWJsZSBp
dHNlbGYgaXMgdmlzaWJsZSBiZWZvcmUgaXRzIFBURSBjYW4gYmUuCj4gwqDCoMKgwqDCoMKgwqDC
oCAqIFdoaWxzdCB3ZSBjb3VsZCBnZXQgYXdheSB3aXRoIGNtcHhjaGc2NF9yZWxlYXNlIGJlbG93
LCB0aGlzCj4gwqDCoMKgwqDCoMKgwqDCoCAqIGRvZXNuJ3QgaGF2ZSBhbnkgb3JkZXJpbmcgc2Vt
YW50aWNzIHdoZW4gIUNPTkZJR19TTVAuCj4gwqDCoMKgwqDCoMKgwqDCoCAqLwo+IMKgwqDCoMKg
wqDCoMKgIGRtYV93bWIoKTsKPgo+IMKgwqDCoMKgwqDCoMKgIG9sZCA9IGNtcHhjaGc2NF9yZWxh
eGVkKHB0ZXAsIGN1cnIsIG5ldyk7Cj4KPiDCoMKgwqDCoMKgwqDCoCBpZiAoY2ZnLT5jb2hlcmVu
dF93YWxrIHx8IChvbGQgJiBBUk1fTFBBRV9QVEVfU1dfU1lOQykpCj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHJldHVybiBvbGQ7Cj4KPiDCoMKgwqDCoMKgwqDCoCAvKiBFdmVuIGlm
IGl0J3Mgbm90IG91cnMsIHRoZXJlJ3Mgbm8gcG9pbnQgd2FpdGluZzsganVzdCBraWNrIAo+IGl0
ICovCj4gwqDCoMKgwqDCoMKgwqAgX19hcm1fbHBhZV9zeW5jX3B0ZShwdGVwLCBjZmcpOwo+IMKg
wqDCoMKgwqDCoMKgIGlmIChvbGQgPT0gY3VycikKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgV1JJVEVfT05DRSgqcHRlcCwgbmV3IHwgQVJNX0xQQUVfUFRFX1NXX1NZTkMpOwo+Cj4g
wqDCoMKgwqDCoMKgwqAgcmV0dXJuIG9sZDsKPiB9CgpJZiBhbm90aGVyIHRocmVhZCBjaGFuZ2Vz
IHRoZSBwdGVwIGJldHdlZW4gY21weGNoZzY0X3JlbGF4ZWQgYW5kCldSSVRFX09OQ0UoKnB0ZXAs
IG5ldyB8IEFSTV9MUEFFX1BURV9TV19TWU5DKSwgdGhlIG9wZXJhdGlvbgpXUklURV9PTkNFIHdp
bGwgb3ZlcndyaXRlIHRoZSBjaGFuZ2UuCgoy44CBdGhlIHNlY29uZAoKPiBmb3IgKGkgPSAwOyBp
IDwgdGFibGVzeiAvIHNpemVvZihwdGUpOyBpKyssIGJsa19wYWRkciArPSBzcGxpdF9zeikgewo+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKiBVbm1hcCEgKi8KPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKGkgPT0gdW5tYXBfaWR4KQo+IGNvbnRpbnVlOwo+Cj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF9fYXJtX2xwYWVfaW5pdF9wdGUoZGF0YSwg
YmxrX3BhZGRyLCBwdGUsIGx2bCwgCj4gJnRhYmxlcFtpXSk7Cj4gfQo+Cj4gcHRlID0gYXJtX2xw
YWVfaW5zdGFsbF90YWJsZSh0YWJsZXAsIHB0ZXAsIGJsa19wdGUsIGNmZyk7CgpXaGVuIGFsdGVy
aW5nIGEgdHJhbnNsYXRpb24gdGFibGUgZGVzY3JpcHRvciBpbmNsdWRlIHNwbGl0IGEgYmxvY2sg
aW50bwpjb25zdGl0dWVudCBncmFudWxlcywgdGhlIEFybXY4LUEgYW5kIFNNTVV2MyBhcmNoaXRl
Y3R1cmVzIHJlcXVpcmUKYSBicmVhay1iZWZvcmUtbWFrZSBwcm9jZWR1cmUuIEJ1dCBpbiB0aGUg
ZnVuY3Rpb24gYXJtX2xwYWVfc3BsaXRfYmxrX3VubWFwLAppdCBjaGFuZ2VzIGEgYmxvY2sgZGVz
Y3JpcHRvciB0byBhbiBlcXVpdmFsZW50IHNwYW4gb2YgcGFnZSB0cmFuc2xhdGlvbnMKZGlyZWN0
bHkuIElzIGl0IGFwcHJvcHJpYXRlIHRvIGRvIHNvPwoKVGhlIGFib3ZlIHR3byBxdWVzdGlvbnMg
bWF5IGJlIG15IHdyb25nIHRoaW5raW5nLiBDb3VkZSB5b3UgcGxlYXNlCmdpdmUgbWUgbW9yZSBo
aW50cz8KClRoYW5rcywKS3Vua3VuIEppYW5nCgoKCgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmlvbW11IG1haWxpbmcgbGlzdAppb21tdUBsaXN0cy5s
aW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFp
bG1hbi9saXN0aW5mby9pb21tdQ==
