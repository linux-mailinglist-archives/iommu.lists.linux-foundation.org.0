Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C78038BFF8
	for <lists.iommu@lfdr.de>; Fri, 21 May 2021 08:48:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B76D884560;
	Fri, 21 May 2021 06:48:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4G4xi5IETJ4G; Fri, 21 May 2021 06:48:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF0DE8457D;
	Fri, 21 May 2021 06:48:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 84DA5C0001;
	Fri, 21 May 2021 06:48:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F02EBC0001
 for <iommu@lists.linux-foundation.org>; Fri, 21 May 2021 06:48:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C5EBF4185B
 for <iommu@lists.linux-foundation.org>; Fri, 21 May 2021 06:48:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QOp7jdT5ww2u for <iommu@lists.linux-foundation.org>;
 Fri, 21 May 2021 06:48:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F0C5541857
 for <iommu@lists.linux-foundation.org>; Fri, 21 May 2021 06:48:10 +0000 (UTC)
Received: from dggems702-chm.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FmcXf3CB9zQm2c;
 Fri, 21 May 2021 14:44:34 +0800 (CST)
Received: from dggema765-chm.china.huawei.com (10.1.198.207) by
 dggems702-chm.china.huawei.com (10.3.19.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Fri, 21 May 2021 14:48:06 +0800
Received: from [10.174.185.210] (10.174.185.210) by
 dggema765-chm.china.huawei.com (10.1.198.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Fri, 21 May 2021 14:48:05 +0800
Subject: Re: [PATCH v15 07/12] iommu/smmuv3: Implement cache_invalidate
To: Eric Auger <eric.auger@redhat.com>, <eric.auger.pro@gmail.com>,
 <iommu@lists.linux-foundation.org>, <linux-kernel@vger.kernel.org>,
 <kvm@vger.kernel.org>, <kvmarm@lists.cs.columbia.edu>, <will@kernel.org>,
 <maz@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
 <alex.williamson@redhat.com>, <tn@semihalf.com>, <zhukeqian1@huawei.com>
References: <20210411111228.14386-1-eric.auger@redhat.com>
 <20210411111228.14386-8-eric.auger@redhat.com>
From: Kunkun Jiang <jiangkunkun@huawei.com>
Message-ID: <fa06a2bf-9e85-8f05-cf51-10f694f486ff@huawei.com>
Date: Fri, 21 May 2021 14:48:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210411111228.14386-8-eric.auger@redhat.com>
Content-Language: en-US
X-Originating-IP: [10.174.185.210]
X-ClientProxiedBy: dggeme708-chm.china.huawei.com (10.1.199.104) To
 dggema765-chm.china.huawei.com (10.1.198.207)
X-CFilter-Loop: Reflected
Cc: jean-philippe@linaro.org, wangxingang5@huawei.com, lushenming@huawei.com,
 wanghaibin.wang@huawei.com, vivek.gautam@arm.com, vsethi@nvidia.com,
 zhangfei.gao@linaro.org
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

SGkgRXJpYywKCk9uIDIwMjEvNC8xMSAxOToxMiwgRXJpYyBBdWdlciB3cm90ZToKPiBJbXBsZW1l
bnQgZG9tYWluLXNlbGVjdGl2ZSwgcGFzaWQgc2VsZWN0aXZlIGFuZCBwYWdlLXNlbGVjdGl2ZQo+
IElPVExCIGludmFsaWRhdGlvbnMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBFcmljIEF1Z2VyIDxlcmlj
LmF1Z2VyQHJlZGhhdC5jb20+Cj4KPiAtLS0KPiB2NCAtPiB2MTU6Cj4gLSByZW1vdmUgdGhlIHJl
ZHVuZGFudCBhcm1fc21tdV9jbWRxX2lzc3VlX3N5bmMoc21tdSkKPiAgICBpbiBJT01NVV9JTlZf
R1JBTlVfQUREUiBjYXNlIChaZW5naHVpKQo+IC0gaWYgUklMIGlzIG5vdCBzdXBwb3J0ZWQgYnkg
dGhlIGhvc3QsIG1ha2Ugc3VyZSB0aGUgZ3JhbnVsZV9zaXplCj4gICAgdGhhdCBpcyBwYXNzZWQg
YnkgdGhlIHVzZXJzcGFjZSBpcyBzdXBwb3J0ZWQgb3IgZml4IGl0Cj4gICAgKENoZW54aWFuZykK
Pgo+IHYxMyAtPiB2MTQ6Cj4gLSBBZGQgZG9tYWluIGludmFsaWRhdGlvbgo+IC0gZG8gZ2xvYmFs
IGludmFsIHdoZW4gYXNpZCBpcyBub3QgcHJvdmlkZWQgd2l0aCBhZGRyCj4gICAgZ3JhbnVsYXJp
dHkKPgo+IHY3IC0+IHY4Ogo+IC0gQVNJRCBiYXNlZCBpbnZhbGlkYXRpb24gdXNpbmcgaW9tbXVf
aW52X3Bhc2lkX2luZm8KPiAtIGNoZWNrIEFSQ0hJRC9QQVNJRCBmbGFncyBpbiBhZGRyIGJhc2Vk
IGludmFsaWRhdGlvbgo+IC0gdXNlIF9fYXJtX3NtbXVfdGxiX2ludl9jb250ZXh0IGFuZCBfX2Fy
bV9zbW11X3RsYl9pbnZfcmFuZ2Vfbm9zeW5jCj4KPiB2NiAtPiB2Nwo+IC0gY2hlY2sgdGhlIHVh
cGkgdmVyc2lvbgo+Cj4gdjMgLT4gdjQ6Cj4gLSBhZGFwdCB0byBjaGFuZ2VzIGluIHRoZSB1YXBp
Cj4gLSBhZGQgc3VwcG9ydCBmb3IgbGVhZiBwYXJhbWV0ZXIKPiAtIGRvIG5vdCB1c2UgYXJtX3Nt
bXVfdGxiX2ludl9yYW5nZV9ub3N5bmMgb3IgYXJtX3NtbXVfdGxiX2ludl9jb250ZXh0Cj4gICAg
YW55bW9yZQo+Cj4gdjIgLT4gdjM6Cj4gLSByZXBsYWNlIF9fYXJtX3NtbXVfdGxiX3N5bmMgYnkg
YXJtX3NtbXVfY21kcV9pc3N1ZV9zeW5jCj4KPiB2MSAtPiB2MjoKPiAtIHByb3Blcmx5IHBhc3Mg
dGhlIGFzaWQKPiAtLS0KPiAgIGRyaXZlcnMvaW9tbXUvYXJtL2FybS1zbW11LXYzL2FybS1zbW11
LXYzLmMgfCA4OSArKysrKysrKysrKysrKysrKysrKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCA4OSBp
bnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pb21tdS9hcm0vYXJtLXNtbXUt
djMvYXJtLXNtbXUtdjMuYyBiL2RyaXZlcnMvaW9tbXUvYXJtL2FybS1zbW11LXYzL2FybS1zbW11
LXYzLmMKPiBpbmRleCA1NmEzMDFmYmU3NWEuLmJmYzExMmNjMGQzOCAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL2lvbW11L2FybS9hcm0tc21tdS12My9hcm0tc21tdS12My5jCj4gKysrIGIvZHJpdmVy
cy9pb21tdS9hcm0vYXJtLXNtbXUtdjMvYXJtLXNtbXUtdjMuYwo+IEBAIC0yOTYxLDYgKzI5NjEs
OTQgQEAgc3RhdGljIHZvaWQgYXJtX3NtbXVfZGV0YWNoX3Bhc2lkX3RhYmxlKHN0cnVjdCBpb21t
dV9kb21haW4gKmRvbWFpbikKPiAgIAltdXRleF91bmxvY2soJnNtbXVfZG9tYWluLT5pbml0X211
dGV4KTsKPiAgIH0KPiAgIAo+ICtzdGF0aWMgaW50Cj4gK2FybV9zbW11X2NhY2hlX2ludmFsaWRh
dGUoc3RydWN0IGlvbW11X2RvbWFpbiAqZG9tYWluLCBzdHJ1Y3QgZGV2aWNlICpkZXYsCj4gKwkJ
CSAgc3RydWN0IGlvbW11X2NhY2hlX2ludmFsaWRhdGVfaW5mbyAqaW52X2luZm8pCj4gK3sKPiAr
CXN0cnVjdCBhcm1fc21tdV9jbWRxX2VudCBjbWQgPSB7Lm9wY29kZSA9IENNRFFfT1BfVExCSV9O
U05IX0FMTH07Cj4gKwlzdHJ1Y3QgYXJtX3NtbXVfZG9tYWluICpzbW11X2RvbWFpbiA9IHRvX3Nt
bXVfZG9tYWluKGRvbWFpbik7Cj4gKwlzdHJ1Y3QgYXJtX3NtbXVfZGV2aWNlICpzbW11ID0gc21t
dV9kb21haW4tPnNtbXU7Cj4gKwo+ICsJaWYgKHNtbXVfZG9tYWluLT5zdGFnZSAhPSBBUk1fU01N
VV9ET01BSU5fTkVTVEVEKQo+ICsJCXJldHVybiAtRUlOVkFMOwo+ICsKPiArCWlmICghc21tdSkK
PiArCQlyZXR1cm4gLUVJTlZBTDsKPiArCj4gKwlpZiAoaW52X2luZm8tPnZlcnNpb24gIT0gSU9N
TVVfQ0FDSEVfSU5WQUxJREFURV9JTkZPX1ZFUlNJT05fMSkKPiArCQlyZXR1cm4gLUVJTlZBTDsK
PiArCj4gKwlpZiAoaW52X2luZm8tPmNhY2hlICYgSU9NTVVfQ0FDSEVfSU5WX1RZUEVfUEFTSUQg
fHwKPiArCSAgICBpbnZfaW5mby0+Y2FjaGUgJiBJT01NVV9DQUNIRV9JTlZfVFlQRV9ERVZfSU9U
TEIpIHsKPiArCQlyZXR1cm4gLUVOT0VOVDsKPiArCX0KPiArCj4gKwlpZiAoIShpbnZfaW5mby0+
Y2FjaGUgJiBJT01NVV9DQUNIRV9JTlZfVFlQRV9JT1RMQikpCj4gKwkJcmV0dXJuIC1FSU5WQUw7
Cj4gKwo+ICsJLyogSU9UTEIgaW52YWxpZGF0aW9uICovCj4gKwo+ICsJc3dpdGNoIChpbnZfaW5m
by0+Z3JhbnVsYXJpdHkpIHsKPiArCWNhc2UgSU9NTVVfSU5WX0dSQU5VX1BBU0lEOgo+ICsJewo+
ICsJCXN0cnVjdCBpb21tdV9pbnZfcGFzaWRfaW5mbyAqaW5mbyA9Cj4gKwkJCSZpbnZfaW5mby0+
Z3JhbnUucGFzaWRfaW5mbzsKPiArCj4gKwkJaWYgKGluZm8tPmZsYWdzICYgSU9NTVVfSU5WX0FE
RFJfRkxBR1NfUEFTSUQpCj4gKwkJCXJldHVybiAtRU5PRU5UOwo+ICsJCWlmICghKGluZm8tPmZs
YWdzICYgSU9NTVVfSU5WX1BBU0lEX0ZMQUdTX0FSQ0hJRCkpCj4gKwkJCXJldHVybiAtRUlOVkFM
Owo+ICsKPiArCQlfX2FybV9zbW11X3RsYl9pbnZfY29udGV4dChzbW11X2RvbWFpbiwgaW5mby0+
YXJjaGlkKTsKPiArCQlyZXR1cm4gMDsKPiArCX0KPiArCWNhc2UgSU9NTVVfSU5WX0dSQU5VX0FE
RFI6Cj4gKwl7Cj4gKwkJc3RydWN0IGlvbW11X2ludl9hZGRyX2luZm8gKmluZm8gPSAmaW52X2lu
Zm8tPmdyYW51LmFkZHJfaW5mbzsKPiArCQlzaXplX3QgZ3JhbnVsZV9zaXplICA9IGluZm8tPmdy
YW51bGVfc2l6ZTsKPiArCQlzaXplX3Qgc2l6ZSA9IGluZm8tPm5iX2dyYW51bGVzICogaW5mby0+
Z3JhbnVsZV9zaXplOwo+ICsJCWJvb2wgbGVhZiA9IGluZm8tPmZsYWdzICYgSU9NTVVfSU5WX0FE
RFJfRkxBR1NfTEVBRjsKPiArCQlpbnQgdGc7Cj4gKwo+ICsJCWlmIChpbmZvLT5mbGFncyAmIElP
TU1VX0lOVl9BRERSX0ZMQUdTX1BBU0lEKQo+ICsJCQlyZXR1cm4gLUVOT0VOVDsKPiArCj4gKwkJ
aWYgKCEoaW5mby0+ZmxhZ3MgJiBJT01NVV9JTlZfQUREUl9GTEFHU19BUkNISUQpKQo+ICsJCQli
cmVhazsKPiArCj4gKwkJdGcgPSBfX2ZmcyhncmFudWxlX3NpemUpOwo+ICsJCWlmIChncmFudWxl
X3NpemUgJiB+KDEgPDwgdGcpKQo+ICsJCQlyZXR1cm4gLUVJTlZBTDsKPiArCQkvKgo+ICsJCSAq
IFdoZW4gUklMIGlzIG5vdCBzdXBwb3J0ZWQsIG1ha2Ugc3VyZSB0aGUgZ3JhbnVsZSBzaXplIHRo
YXQgaXMKPiArCQkgKiBwYXNzZWQgaXMgc3VwcG9ydGVkLiBJbiBSSUwgbW9kZSwgdGhpcyBpcyBl
bmZvcmNlZCBpbgo+ICsJCSAqIF9fYXJtX3NtbXVfdGxiX2ludl9yYW5nZSgpCj4gKwkJICovCj4g
KwkJaWYgKCEoc21tdS0+ZmVhdHVyZXMgJiBBUk1fU01NVV9GRUFUX1JBTkdFX0lOVikgJiYKPiAr
CQkgICAgIShncmFudWxlX3NpemUgJiBzbW11X2RvbWFpbi0+ZG9tYWluLnBnc2l6ZV9iaXRtYXAp
KSB7Cj4gKwkJCXRnID0gX19mZnMoc21tdV9kb21haW4tPmRvbWFpbi5wZ3NpemVfYml0bWFwKTsK
PiArCQkJZ3JhbnVsZV9zaXplID0gMSA8PCB0ZzsKPiArCQkJc2l6ZSA9IHNpemUgPj4gdGc7Cj4g
KwkJfQo+ICsKPiArCQlhcm1fc21tdV90bGJfaW52X3JhbmdlX2RvbWFpbihpbmZvLT5hZGRyLCBz
aXplLAo+ICsJCQkJCSAgICAgIGdyYW51bGVfc2l6ZSwgbGVhZiwKPiArCQkJCQkgICAgICBpbmZv
LT5hcmNoaWQsIHNtbXVfZG9tYWluKTsKSSBlbmNvdW50ZXJlZCBzb21lIGVycm9ycyB3aGVuIEkg
dGVzdGVkIHRoZSBTTU1VIG5lc3RlZCBtb2RlLgoKVGVzdCBzY2VuYXJpbyBkZXNjcmlwdGlvbjoK
Z3Vlc3Qga2VybmVsOiA0S0IgdHJhbnNsYXRpb24gZ3JhbnVsZQpob3N0IGtlcm5lbDogMTZLQiB0
cmFuc2xhdGlvbiBncmFudWxlCgplcnJvcnM6CjEuIGVuY291bnRlcmVkIGFuIGVuZGxlc3MgbG9v
cCBpbiBfX2FybV9zbW11X3RsYl9pbnZfcmFuZ2UgYmVjYXVzZQpudW1fcGFnZXMgaXMgMAoyLiBl
bmNvdW50ZXJlZCBDRVJST1JfSUxMIGJlY2F1c2UgdGhlIGZpZWxkcyBvZiBUTEIgaW52YWxpZGF0
aW9uCmNvbW1hbmQgYXJlIGFzIGZvbGxvdzogVEcgPSAyLCBOVU0gPSAwLCBTQ0FMRSA9IDAsIFRU
TCA9IDAuIFRoZQpjb21iaW5hdGlvbiBpcyBleGFjdGx5IHRoZSBraW5kIG9mIHJlc2VydmVkIGNv
bWJpbmF0aW9uIHBvaW50ZWQKb3V0IGluIHRoZSBTTU1VdjMgc3BlYyhwYWdlIDE0My0xNDQsIHZl
cnNpb24gRC5hKQoKQWNjb3JkaW5nIHRvIG15IGFuYWx5c2lzLCB3ZSBzaG91bGQgZG8gYSBiaXQg
bW9yZSB2YWxpZGF0aW9uIG9uIHRoZQonc2l6ZScgYW5kICdncmFudWxlX3NpemUnIHdoZW4gU01N
VSBzdXBwb3J0cyBSSUw6CjEuIEFsaWduICdzaXplJyB3aXRoIHRoZSBzbWFsbGVzdCBncmFudWxl
IHNpemUgc3VwcG9ydGVkIGJ5IFNNTVUgdXB3YXJkcy4KMi4gSWYgdGhlIGdyYW51bGUgc2l6ZSBp
c24ndCBzdXBwb3J0ZWQgYnkgU01NVSwgd2Ugc2V0IGl0IHRvIHRoZSBzbWFsbGVzdApncmFudWxl
IHNpemUgc3VwcG9ydGVkIGJ5IFNNTVUKCkkgc2VudCB0d28gcGF0Y2hlcyB0byBmaXggdGhlbSBp
biB0aGXCoCBfX2FybV9zbW11X3RsYl9pbnZfcmFuZ2UoKS4gWzFdCihUaGVzZSBwYXRjaGVzIG1h
eSBiZXR0ZXIgZXhwbGFpbiB3aGF0IEkgd2FudCB0byBleHByZXNzLikKQWNjb3JkaW5nIHRvIHRo
ZSByZXBseSwgaXQgc2VlbXMgdGhhdCBpdCBpcyBtb3JlIGFwcHJvcHJpYXRlIHRvIG1vZGlmeSBo
ZXJlLgoKVGhhbmtzLApLdW5rdW4gSmlhbmcKClsxXSBbUkZDIFBBVENIIHYxIDAvMl0gaW9tbXUv
YXJtLXNtbXUtdjM6IEFkZCBzb21lIHBhcmFtZXRlciBjaGVjayBpbiAKX19hcm1fc21tdV90bGJf
aW52X3JhbmdlKCkKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtaW9tbXUvMjAyMTA1MTkw
OTQzMDcuMzI3NS0xLWppYW5na3Vua3VuQGh1YXdlaS5jb20vCj4gKwkJcmV0dXJuIDA7Cj4gKwl9
Cj4gKwljYXNlIElPTU1VX0lOVl9HUkFOVV9ET01BSU46Cj4gKwkJYnJlYWs7Cj4gKwlkZWZhdWx0
Ogo+ICsJCXJldHVybiAtRUlOVkFMOwo+ICsJfQo+ICsKPiArCS8qIEdsb2JhbCBTMSBpbnZhbGlk
YXRpb24gKi8KPiArCWNtZC50bGJpLnZtaWQgICA9IHNtbXVfZG9tYWluLT5zMl9jZmcudm1pZDsK
PiArCWFybV9zbW11X2NtZHFfaXNzdWVfY21kKHNtbXUsICZjbWQpOwo+ICsJYXJtX3NtbXVfY21k
cV9pc3N1ZV9zeW5jKHNtbXUpOwo+ICsJcmV0dXJuIDA7Cj4gK30KPiArCj4gICBzdGF0aWMgYm9v
bCBhcm1fc21tdV9kZXZfaGFzX2ZlYXR1cmUoc3RydWN0IGRldmljZSAqZGV2LAo+ICAgCQkJCSAg
ICAgZW51bSBpb21tdV9kZXZfZmVhdHVyZXMgZmVhdCkKPiAgIHsKPiBAQCAtMzA2MCw2ICszMTQ4
LDcgQEAgc3RhdGljIHN0cnVjdCBpb21tdV9vcHMgYXJtX3NtbXVfb3BzID0gewo+ICAgCS5wdXRf
cmVzdl9yZWdpb25zCT0gZ2VuZXJpY19pb21tdV9wdXRfcmVzdl9yZWdpb25zLAo+ICAgCS5hdHRh
Y2hfcGFzaWRfdGFibGUJPSBhcm1fc21tdV9hdHRhY2hfcGFzaWRfdGFibGUsCj4gICAJLmRldGFj
aF9wYXNpZF90YWJsZQk9IGFybV9zbW11X2RldGFjaF9wYXNpZF90YWJsZSwKPiArCS5jYWNoZV9p
bnZhbGlkYXRlCT0gYXJtX3NtbXVfY2FjaGVfaW52YWxpZGF0ZSwKPiAgIAkuZGV2X2hhc19mZWF0
CQk9IGFybV9zbW11X2Rldl9oYXNfZmVhdHVyZSwKPiAgIAkuZGV2X2ZlYXRfZW5hYmxlZAk9IGFy
bV9zbW11X2Rldl9mZWF0dXJlX2VuYWJsZWQsCj4gICAJLmRldl9lbmFibGVfZmVhdAk9IGFybV9z
bW11X2Rldl9lbmFibGVfZmVhdHVyZSwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwppb21tdSBtYWlsaW5nIGxpc3QKaW9tbXVAbGlzdHMubGludXgtZm91
bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlz
dGluZm8vaW9tbXU=
