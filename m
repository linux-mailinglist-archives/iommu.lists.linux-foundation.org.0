Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBDB25A327
	for <lists.iommu@lfdr.de>; Wed,  2 Sep 2020 04:51:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 44FF8204A8;
	Wed,  2 Sep 2020 02:51:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S1tRw+ZaCcnA; Wed,  2 Sep 2020 02:51:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id B360F2041D;
	Wed,  2 Sep 2020 02:51:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A7408C0051;
	Wed,  2 Sep 2020 02:51:06 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 77CA8C0051
 for <iommu@lists.linux-foundation.org>; Wed,  2 Sep 2020 02:51:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 639F2867B2
 for <iommu@lists.linux-foundation.org>; Wed,  2 Sep 2020 02:51:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id otFkX2DVwT0i for <iommu@lists.linux-foundation.org>;
 Wed,  2 Sep 2020 02:51:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 50AE78583C
 for <iommu@lists.linux-foundation.org>; Wed,  2 Sep 2020 02:51:03 +0000 (UTC)
IronPort-SDR: Cn2qEgh7ORyDv/xV4RmEKJCXYbdpYYIkpNsOR3wIkVkNqedXTU6oENeI/7+1tgo2w9aV+CfkN/
 XiUUHSSqXfcg==
X-IronPort-AV: E=McAfee;i="6000,8403,9731"; a="145044178"
X-IronPort-AV: E=Sophos;i="5.76,381,1592895600"; d="scan'208";a="145044178"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2020 19:51:02 -0700
IronPort-SDR: F1pTRPQhuQAqudimA10/4K905gDPDeDtrv3KjP3Ya45YnkRPTbwKkjDLTo4mN9botj4GO/DW4K
 ABtap7SCBaKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,381,1592895600"; d="scan'208";a="325603210"
Received: from allen-box.sh.intel.com (HELO [10.239.159.139])
 ([10.239.159.139])
 by fmsmga004.fm.intel.com with ESMTP; 01 Sep 2020 19:51:01 -0700
Subject: Re: [Regression] [PATCH] iommu: Avoid crash in
 init_no_remapping_devices if iommu is NULL
To: Torsten Hilbrich <torsten.hilbrich@secunet.com>,
 Joerg Roedel <jroedel@suse.de>
References: <e27cd096-a721-db9d-e4ce-7a432ed6cd4c@secunet.com>
 <12935d0b-61ff-d274-b1ee-3b1fba36bdc7@linux.intel.com>
 <1eafacd8-8cdb-d6ae-130c-dca66dbe3598@secunet.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <1923c791-2ef4-47e5-788d-f785f6db39f9@linux.intel.com>
Date: Wed, 2 Sep 2020 10:45:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1eafacd8-8cdb-d6ae-130c-dca66dbe3598@secunet.com>
Content-Language: en-US
Cc: iommu@lists.linux-foundation.org
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

SGkgVG9yc3RlbiwKCk9uIDkvMS8yMCAxMDo0MSBQTSwgVG9yc3RlbiBIaWxicmljaCB3cm90ZToK
PiBPbiAwMS4wOS4yMCAwNDowMiwgTHUgQmFvbHUgd3JvdGU6Cj4gWy4uLl0KPj4gVGhpcyBsb29r
cyBtb3JlIGxpa2UgYSBnZW5lcmljIGlzc3VlLCB1c2VkLWJlZm9yZS1hbGxvY2F0ZWQsIGFuZCBz
aG91bGQKPj4gYmUgZml4ZWQgaW4gaW9tbXUuYyBpbnN0ZWFkIG9mIFZULWQgZHJpdmVyLiBIb3cg
YWJvdXQKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaW9tbXUvaW9tbXUuYyBiL2RyaXZlcnMv
aW9tbXUvaW9tbXUuYwo+PiBpbmRleCA4ZmQ5M2E1Yjg3NjQuLmE1OTlkYTg3ZWI2MCAxMDA2NDQK
Pj4gLS0tIGEvZHJpdmVycy9pb21tdS9pb21tdS5jCj4+ICsrKyBiL2RyaXZlcnMvaW9tbXUvaW9t
bXUuYwo+PiBAQCAtMTkwLDYgKzE5MCwyOCBAQCBzdGF0aWMgdm9pZCBkZXZfaW9tbXVfZnJlZShz
dHJ1Y3QgZGV2aWNlICpkZXYpCj4+ICDCoMKgwqDCoMKgwqDCoCBkZXYtPmlvbW11ID0gTlVMTDsK
Pj4gIMKgfQo+Pgo+PiArdm9pZCAqZGV2X2lvbW11X3ByaXZfZ2V0KHN0cnVjdCBkZXZpY2UgKmRl
dikKPj4gK3sKPj4gK8KgwqDCoMKgwqDCoCBzdHJ1Y3QgZGV2X2lvbW11ICpwYXJhbSA9IGRldl9p
b21tdV9nZXQoZGV2KTsKPj4gKwo+PiArwqDCoMKgwqDCoMKgIGlmIChXQVJOX09OKCFwYXJhbSkp
Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBFUlJfUFRSKC1FTk9NRU0p
Owo+PiArCj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gcGFyYW0tPnByaXY7Cj4+ICt9Cj4+ICtF
WFBPUlRfU1lNQk9MX0dQTChkZXZfaW9tbXVfcHJpdl9nZXQpOwo+PiArCj4+ICt2b2lkIGRldl9p
b21tdV9wcml2X3NldChzdHJ1Y3QgZGV2aWNlICpkZXYsIHZvaWQgKnByaXYpCj4+ICt7Cj4+ICvC
oMKgwqDCoMKgwqAgc3RydWN0IGRldl9pb21tdSAqcGFyYW0gPSBkZXZfaW9tbXVfZ2V0KGRldik7
Cj4+ICsKPj4gK8KgwqDCoMKgwqDCoCBpZiAoV0FSTl9PTighcGFyYW0pKQo+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm47Cj4+ICsKPj4gK8KgwqDCoMKgwqDCoMKgIHBhcmFt
LT5wcml2ID0gcHJpdjsKPj4gK30KPj4gK0VYUE9SVF9TWU1CT0xfR1BMKGRldl9pb21tdV9wcml2
X3NldCk7Cj4+ICsKPiAKPiBUaGlzIGZpeCB3b3VsZCB3b3JrIGluIG15IGNhc2UuIEkgdGVzdGVk
IGl0IHdpdGggc2xpZ2h0IG1vZGlmaWNhdGlvbiB0bwo+IHJlcGxhY2UgdGhlIGlubGluZSByb3V0
aW5lcyBpbiBpbmNsdWRlL2xpbnV4L2lvbW11LmguCj4gCj4gVGhlIFdBUk5fT04gd2FzIG5vdCB0
cmlnZ2VyZWQgZHVyaW5nIG15IHRlc3RzLiBIb3dldmVyLCBsb29raW5nIGF0IHRoZQo+IGRlZmlu
aXRpb24gb2YgZGV2X2lvbW11X2dldCB0aGlzIGlzIHRvIGJlIGV4cGVjdGVkLgoKU28gSSBzdXBw
b3NlIHlvdSB3aWxsIHBvc3QgYSBuZXcgdmVyc2lvbi4gOi0pCgpCZXN0IHJlZ2FyZHMsCmJhb2x1
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlvbW11IG1h
aWxpbmcgbGlzdAppb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3Rz
LmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9pb21tdQ==
