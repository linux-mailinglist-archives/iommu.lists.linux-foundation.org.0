Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 44330211910
	for <lists.iommu@lfdr.de>; Thu,  2 Jul 2020 03:36:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B8DD48B585;
	Thu,  2 Jul 2020 01:36:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AL7AR5HwLtMz; Thu,  2 Jul 2020 01:36:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 43EDC8B56E;
	Thu,  2 Jul 2020 01:36:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 332E7C0733;
	Thu,  2 Jul 2020 01:36:50 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CB3E0C0733
 for <iommu@lists.linux-foundation.org>; Thu,  2 Jul 2020 01:36:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B1CA78B564
 for <iommu@lists.linux-foundation.org>; Thu,  2 Jul 2020 01:36:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7oXVdqfa9988 for <iommu@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 01:36:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7D3F08B56E
 for <iommu@lists.linux-foundation.org>; Thu,  2 Jul 2020 01:36:47 +0000 (UTC)
IronPort-SDR: 9UqxBx1usTdNW/w6NEd+kJmoU8ZhHi9VmhDebcLnqZy/4xsJdBoDlcJuvvzbkjx4vjHjKBlARu
 ClPwkXLT4zzw==
X-IronPort-AV: E=McAfee;i="6000,8403,9669"; a="144934190"
X-IronPort-AV: E=Sophos;i="5.75,302,1589266800"; d="scan'208";a="144934190"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2020 18:36:46 -0700
IronPort-SDR: WkKQyRyyqk5ma2TxGzRlpWt9aUvcoXaeaKhhIOT8ecUHVr18IikLb5bXNbGzjSNv+vu2aYJSOH
 JT/Lsj+Ot3yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,302,1589266800"; d="scan'208";a="304068748"
Received: from allen-box.sh.intel.com (HELO [10.239.159.139])
 ([10.239.159.139])
 by fmsmga004.fm.intel.com with ESMTP; 01 Jul 2020 18:36:44 -0700
Subject: Re: [PATCH 1/2] iommu: Add iommu_group_get/set_domain()
To: Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Alex Williamson <alex.williamson@redhat.com>
References: <20200627031532.28046-1-baolu.lu@linux.intel.com>
 <acc0a8fd-bd23-fc34-aecc-67796ab216e7@arm.com>
 <5dc1cece-6111-9b56-d04c-9553d592675b@linux.intel.com>
 <48dd9f1e-c18b-77b7-650a-c35ecbb69f2b@arm.com>
 <c38784ad-9dba-0840-3a61-e2c21e781f1e@linux.intel.com>
 <ffbb405b-5617-5659-3fc1-302c530aceef@arm.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <122f0e0a-5220-f00a-a329-6679d5aa8077@linux.intel.com>
Date: Thu, 2 Jul 2020 09:32:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <ffbb405b-5617-5659-3fc1-302c530aceef@arm.com>
Content-Language: en-US
Cc: Kevin Tian <kevin.tian@intel.com>, Dave Jiang <dave.jiang@intel.com>,
 Ashok Raj <ashok.raj@intel.com>, kvm@vger.kernel.org,
 Cornelia Huck <cohuck@redhat.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org
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

SGVsbG8sCgpPbiA3LzEvMjAgODoxOCBQTSwgUm9iaW4gTXVycGh5IHdyb3RlOgo+IE9uIDIwMjAt
MDctMDEgMDg6MzIsIEx1IEJhb2x1IHdyb3RlOgo+PiBIaSBSb2JpbiwKPj4KPj4gT24gMjAyMC83
LzEgMDo1MSwgUm9iaW4gTXVycGh5IHdyb3RlOgo+Pj4gT24gMjAyMC0wNi0zMCAwMjowMywgTHUg
QmFvbHUgd3JvdGU6Cj4+Pj4gSGkgUm9iaW4sCj4+Pj4KPj4+PiBPbiA2LzI5LzIwIDc6NTYgUE0s
IFJvYmluIE11cnBoeSB3cm90ZToKPj4+Pj4gT24gMjAyMC0wNi0yNyAwNDoxNSwgTHUgQmFvbHUg
d3JvdGU6Cj4+Pj4+PiBUaGUgaGFyZHdhcmUgYXNzaXN0YW50IHZmaW8gbWVkaWF0ZWQgZGV2aWNl
IGlzIGEgdXNlIGNhc2Ugb2YgaW9tbXUKPj4+Pj4+IGF1eC1kb21haW4uIFRoZSBpbnRlcmFjdGlv
bnMgYmV0d2VlbiB2ZmlvL21kZXYgYW5kIGlvbW11IGR1cmluZyBtZGV2Cj4+Pj4+PiBjcmVhdGlv
biBhbmQgcGFzc3RociBhcmU6Cj4+Pj4+Pgo+Pj4+Pj4gLSBDcmVhdGUgYSBncm91cCBmb3IgbWRl
diB3aXRoIGlvbW11X2dyb3VwX2FsbG9jKCk7Cj4+Pj4+PiAtIEFkZCB0aGUgZGV2aWNlIHRvIHRo
ZSBncm91cCB3aXRoCj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgIGdyb3VwID0gaW9tbXVfZ3JvdXBf
YWxsb2MoKTsKPj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqAgaWYgKElTX0VSUihncm91cCkpCj4+Pj4+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gUFRSX0VSUihncm91cCk7
Cj4+Pj4+Pgo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCByZXQgPSBpb21tdV9ncm91cF9hZGRfZGV2
aWNlKGdyb3VwLCAmbWRldi0+ZGV2KTsKPj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqAgaWYgKCFyZXQp
Cj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkZXZfaW5mbygmbWRldi0+
ZGV2LCAiTURFVjogZ3JvdXBfaWQgPSAlZFxuIiwKPj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlvbW11X2dyb3VwX2lkKGdyb3VwKSk7Cj4+
Pj4+PiAtIEFsbG9jYXRlIGFuIGF1eC1kb21haW4KPj4+Pj4+IMKgwqDCoMKgaW9tbXVfZG9tYWlu
X2FsbG9jKCkKPj4+Pj4+IC0gQXR0YWNoIHRoZSBhdXgtZG9tYWluIHRvIHRoZSBwaHlzaWNhbCBk
ZXZpY2UgZnJvbSB3aGljaCB0aGUgbWRldiBpcwo+Pj4+Pj4gwqDCoCBjcmVhdGVkLgo+Pj4+Pj4g
wqDCoMKgwqBpb21tdV9hdXhfYXR0YWNoX2RldmljZSgpCj4+Pj4+Pgo+Pj4+Pj4gSW4gdGhlIHdo
b2xlIHByb2Nlc3MsIGFuIGlvbW11IGdyb3VwIHdhcyBhbGxvY2F0ZWQgZm9yIHRoZSBtZGV2IAo+
Pj4+Pj4gYW5kIGFuCj4+Pj4+PiBpb21tdSBkb21haW4gd2FzIGF0dGFjaGVkIHRvIHRoZSBncm91
cCwgYnV0IHRoZSBncm91cC0+ZG9tYWluIGxlYXZlcwo+Pj4+Pj4gTlVMTC4gQXMgdGhlIHJlc3Vs
dCwgaW9tbXVfZ2V0X2RvbWFpbl9mb3JfZGV2KCkgZG9lc24ndCB3b3JrIGFueW1vcmUuCj4+Pj4+
Pgo+Pj4+Pj4gVGhpcyBhZGRzIGlvbW11X2dyb3VwX2dldC9zZXRfZG9tYWluKCkgc28gdGhhdCBn
cm91cC0+ZG9tYWluIGNvdWxkIGJlCj4+Pj4+PiBtYW5hZ2VkIHdoZW5ldmVyIGEgZG9tYWluIGlz
IGF0dGFjaGVkIG9yIGRldGFjaGVkIHRocm91Z2ggdGhlIAo+Pj4+Pj4gYXV4LWRvbWFpbgo+Pj4+
Pj4gYXBpJ3MuCj4+Pj4+Cj4+Pj4+IExldHRpbmcgZXh0ZXJuYWwgY2FsbGVycyBwb2tlIGFyb3Vu
ZCBkaXJlY3RseSBpbiB0aGUgaW50ZXJuYWxzIG9mIAo+Pj4+PiBpb21tdV9ncm91cCBkb2Vzbid0
IGxvb2sgcmlnaHQgdG8gbWUuCj4+Pj4KPj4+PiBVbmZvcnR1bmF0ZWx5LCBpdCBzZWVtcyB0aGF0
IHRoZSB2aWZvIGlvbW11IGFic3RyYWN0aW9uIGlzIGRlZXBseSBib3VuZAo+Pj4+IHRvIHRoZSBJ
T01NVSBzdWJzeXN0ZW0uIFdlIGNhbiBlYXNpbHkgZmluZCBvdGhlciBleGFtcGxlczoKPj4+Pgo+
Pj4+IGlvbW11X2dyb3VwX2dldC9zZXRfaW9tbXVkYXRhKCkKPj4+PiBpb21tdV9ncm91cF9nZXQv
c2V0X25hbWUoKQo+Pj4+IC4uLgo+Pj4KPj4+IFN1cmUsIGJ1dCB0aG9zZSBhcmUgd2F5cyBmb3Ig
dXNlcnMgb2YgYSBncm91cCB0byBhdHRhY2ggdXNlZnVsIAo+Pj4gaW5mb3JtYXRpb24gb2YgdGhl
aXIgb3duIHRvIGl0LCB0aGF0IGRvZXNuJ3QgbWF0dGVyIHRvIHRoZSBJT01NVSAKPj4+IHN1YnN5
c3RlbSBpdHNlbGYuIFRoZSBpbnRlcmZhY2UgeW91J3ZlIHByb3Bvc2VkIGdpdmVzIGNhbGxlcnMg
cmljaCAKPj4+IG5ldyBvcHBvcnR1bml0aWVzIHRvIGZ1bmRhbWVudGFsbHkgYnJlYWsgY29ycmVj
dCBvcGVyYXRpb24gb2YgdGhlIEFQSToKPj4+Cj4+PiDCoMKgwqDCoMKgZG9tID0gaW9tbXVfZG9t
YWluX2FsbG9jKCk7Cj4+PiDCoMKgwqDCoMKgaW9tbXVfYXR0YWNoX2dyb3VwKGRvbSwgZ3JwKTsK
Pj4+IMKgwqDCoMKgwqAuLi4KPj4+IMKgwqDCoMKgwqBpb21tdV9ncm91cF9zZXRfZG9tYWluKGdy
cCwgTlVMTCk7Cj4+PiDCoMKgwqDCoMKgLy8gb29wcywgbGVha2VkIGFuZCBjYW4ndCBldmVyIGRl
dGFjaCBwcm9wZXJseSBub3cKPj4+Cj4+PiBvciBwZXJoYXBzOgo+Pj4KPj4+IMKgwqDCoMKgwqBn
cnAgPSBpb21tdV9ncm91cF9hbGxvYygpOwo+Pj4gwqDCoMKgwqDCoGlvbW11X2dyb3VwX2FkZF9k
ZXZpY2UoZ3JwLCBkZXYpOwo+Pj4gwqDCoMKgwqDCoGlvbW11X2dyb3VwX3NldF9kb21haW4oZ3Jw
LCBkb20pOwo+Pj4gwqDCoMKgwqDCoC4uLgo+Pj4gwqDCoMKgwqDCoGlvbW11X2RldGFjaF9ncm91
cChkb20sIGdycCk7Cj4+PiDCoMKgwqDCoMKgLy8gb29wcywgSU9NTVUgZHJpdmVyIG1pZ2h0IG5v
dCBoYW5kbGUgdGhpcwo+Pj4KPj4+Pj4gSWYgYSByZWd1bGFyIGRldmljZSBpcyBhdHRhY2hlZCB0
byBvbmUgb3IgbW9yZSBhdXggZG9tYWlucyBmb3IgCj4+Pj4+IFBBU0lEIHVzZSwgaW9tbXVfZ2V0
X2RvbWFpbl9mb3JfZGV2KCkgaXMgc3RpbGwgZ29pbmcgdG8gcmV0dXJuIHRoZSAKPj4+Pj4gcHJp
bWFyeSBkb21haW4sIHNvIHdoeSBzaG91bGQgaXQgYmUgZXhwZWN0ZWQgdG8gYmVoYXZlIGRpZmZl
cmVudGx5IAo+Pj4+PiBmb3IgbWVkaWF0ZWQKPj4+Pgo+Pj4+IFVubGlrZSB0aGUgbm9ybWFsIGRl
dmljZSBhdHRhY2gsIHdlIHdpbGwgZW5jb3VudGVyIHR3byBkZXZpY2VzIHdoZW4gaXQKPj4+PiBj
b21lcyB0byBhdXgtZG9tYWluLgo+Pj4+Cj4+Pj4gLSBQYXJlbnQgcGh5c2ljYWwgZGV2aWNlIC0g
dGhpcyBtaWdodCBiZSwgZm9yIGV4YW1wbGUsIGEgUENJZSBkZXZpY2UKPj4+PiB3aXRoIFBBU0lE
IGZlYXR1cmUgc3VwcG9ydCwgaGVuY2UgaXQgaXMgYWJsZSB0byB0YWcgYW4gdW5pcXVlIFBBU0lE
Cj4+Pj4gZm9yIERNQSB0cmFuc2ZlcnMgb3JpZ2luYXRlZCBmcm9tIGl0cyBzdWJzZXQuIFRoZSBk
ZXZpY2UgZHJpdmVyIGhlbmNlCj4+Pj4gaXMgYWJsZSB0byB3cmFwcGVyIHRoaXMgc3Vic2V0IGlu
dG8gYW4gaXNvbGF0ZWQ6Cj4+Pj4KPj4+PiAtIE1lZGlhdGVkIGRldmljZSAtIGEgZmFrZSBkZXZp
Y2UgY3JlYXRlZCBieSB0aGUgZGV2aWNlIGRyaXZlciAKPj4+PiBtZW50aW9uZWQKPj4+PiBhYm92
ZS4KPj4+Pgo+Pj4+IFllcy4gQWxsIHlvdSBtZW50aW9uZWQgYXJlIHJpZ2h0IGZvciB0aGUgcGFy
ZW50IGRldmljZS4gQnV0IGZvciAKPj4+PiBtZWRpYXRlZAo+Pj4+IGRldmljZSwgaW9tbXVfZ2V0
X2RvbWFpbl9mb3JfZGV2KCkgZG9lc24ndCB3b3JrIGV2ZW4gaXQgaGFzIGFuIHZhbGlkCj4+Pj4g
aW9tbXVfZ3JvdXAgYW5kIGlvbW11X2RvbWFpbi4KPj4+Pgo+Pj4+IGlvbW11X2dldF9kb21haW5f
Zm9yX2RldigpIGlzIGEgbmVjZXNzYXJ5IGludGVyZmFjZSBmb3IgZGV2aWNlIGRyaXZlcnMKPj4+
PiB3aGljaCB3YW50IHRvIHN1cHBvcnQgYXV4LWRvbWFpbi4gRm9yIGV4YW1wbGUsCj4+Pgo+Pj4g
T25seSBpZiB0aGV5IHdhbnQgdG8gZm9sbG93IHRoaXMgdmVyeSBzcGVjaWZpYyBub3Rpb24gb2Yg
dXNpbmcgCj4+PiBtYWRlLXVwIGRldmljZXMgYW5kIGdyb3VwcyB0byByZXByZXNlbnQgYXV4IGF0
dGFjaG1lbnRzLiBFdmVuIGlmIGEgCj4+PiBkcml2ZXIgbWFuYWdpbmcgaXRzIG93biBhdXggZG9t
YWlucyBlbnRpcmVseSBwcml2YXRlbHkgZG9lcyBjcmVhdGUgCj4+PiBjaGlsZCBkZXZpY2VzIGZv
ciB0aGVtLCBpdCdzIG5vdCBsaWtlIGl0IGNhbid0IGtlZXAgaXRzIGRvbWFpbiAKPj4+IHBvaW50
ZXJzIGluIGRydmRhdGEgaWYgaXQgd2FudHMgdG8gOykKPj4+Cj4+PiBMZXQncyBub3QgY29uZmxh
dGUgdGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24gb2YgdmZpb19tZGV2IHdpdGggdGhlIAo+Pj4g
Z2VuZXJhbCBjb25jZXB0cyBpbnZvbHZlZCBoZXJlLgo+Pj4KPj4+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBzdHJ1Y3QgaW9tbXVfZG9tYWluICpkb21haW47Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqAgc3RydWN0IGRldmljZSAqZGV2ID0gbWRldl9kZXYobWRldik7Cj4+Pj4gwqDCoMKgwqDCoMKg
IHVuc2lnbmVkIGxvbmcgcGFzaWQ7Cj4+Pj4KPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkb21h
aW4gPSBpb21tdV9nZXRfZG9tYWluX2Zvcl9kZXYoZGV2KTsKPj4+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBpZiAoIWRvbWFpbikKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgcmV0dXJuIC1FTk9ERVY7Cj4+Pj4KPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwYXNpZCA9
IGlvbW11X2F1eF9nZXRfcGFzaWQoZG9tYWluLCBkZXYtPnBhcmVudCk7Cj4+Pj4gwqDCoMKgwqDC
oMKgIGlmIChwYXNpZCA9PSBJT0FTSURfSU5WQUxJRCkKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDC
oCByZXR1cm4gLUVJTlZBTDsKPj4+Pgo+Pj4+IMKgwqDCoMKgwqDCoCAvKiBQcm9ncmFtIHRoZSBk
ZXZpY2UgY29udGV4dCB3aXRoIHRoZSBQQVNJRCB2YWx1ZSAqLwo+Pj4+IMKgwqDCoMKgwqDCoCAu
Li4uCj4+Pj4KPj4+PiBXaXRob3V0IHRoaXMgZml4LCBpb21tdV9nZXRfZG9tYWluX2Zvcl9kZXYo
KSBhbHdheXMgcmV0dXJucyBOVUxMIGFuZCAKPj4+PiB0aGUKPj4+PiBkZXZpY2UgZHJpdmVyIGhh
cyBubyBtZWFucyB0byBzdXBwb3J0IGF1eC1kb21haW4uCj4+Pgo+Pj4gU28gZWl0aGVyIHRoZSBJ
T01NVSBBUEkgaXRzZWxmIGlzIG1pc3NpbmcgdGhlIGFiaWxpdHkgdG8gZG8gdGhlIHJpZ2h0IAo+
Pj4gdGhpbmcgaW50ZXJuYWxseSwgb3IgdGhlIG1kZXYgbGF5ZXIgaXNuJ3QgdXNpbmcgaXQgYXBw
cm9wcmlhdGVseS4gCj4+PiBFaXRoZXIgd2F5LCBzaW1wbHkgcHVuY2hpbmcgaG9sZXMgaW4gdGhl
IEFQSSBmb3IgbWRldiB0byBoYWNrIGFyb3VuZCAKPj4+IGl0cyBvd24gbWVzcyBkb2Vzbid0IHNl
ZW0gbGlrZSB0aGUgYmVzdCB0aGluZyB0byBkby4KPj4+Cj4+PiBUaGUgaW5pdGlhbCBpbXByZXNz
aW9uIEkgZ290IHdhcyB0aGF0IGl0J3MgaW1wbGljaXRseSBhc3N1bWVkIGhlcmUgCj4+PiB0aGF0
IHRoZSBtZGV2IGl0c2VsZiBpcyBhdHRhY2hlZCB0byBleGFjdGx5IG9uZSBhdXggZG9tYWluIGFu
ZCAKPj4+IG5vdGhpbmcgZWxzZSwgYXQgd2hpY2ggcG9pbnQgSSB3b3VsZCB3b25kZXIgd2h5IGl0
J3MgdXNpbmcgYXV4IGF0IAo+Pj4gYWxsLCBidXQgYXJlIHlvdSBzYXlpbmcgdGhhdCBpbiBmYWN0
IG5vIGF0dGFjaCBoYXBwZW5zIHdpdGggdGhlIG1kZXYgCj4+PiBncm91cCBlaXRoZXIgd2F5LCBv
bmx5IHRvIHRoZSBwYXJlbnQgZGV2aWNlPwo+Pj4KPj4+IEknbGwgYWRtaXQgSSdtIG5vdCBodWdl
bHkgZmFtaWxpYXIgd2l0aCBhbnkgb2YgdGhpcywgYnV0IGl0IHNlZW1zIHRvIAo+Pj4gbWUgdGhh
dCB0aGUgbG9naWNhbCBmbG93IHNob3VsZCBiZToKPj4+Cj4+PiDCoMKgwqDCoMKgLSBhbGxvY2F0
ZSBkb21haW4KPj4+IMKgwqDCoMKgwqAtIGF0dGFjaCBhcyBhdXggdG8gcGFyZW50Cj4+PiDCoMKg
wqDCoMKgLSByZXRyaWV2ZSBhdXggZG9tYWluIFBBU0lECj4+PiDCoMKgwqDCoMKgLSBjcmVhdGUg
bWRldiBjaGlsZCBiYXNlZCBvbiBQQVNJRAo+Pj4gwqDCoMKgwqDCoC0gYXR0YWNoIG1kZXYgdG8g
ZG9tYWluIChub3JtYWxseSkKPj4+Cj4+PiBPZiBjb3Vyc2UgdGhhdCBtaWdodCByZXF1aXJlIGdp
dmluZyB0aGUgSU9NTVUgQVBJIGEgcHJvcGVyIAo+Pj4gZmlyc3QtY2xhc3Mgbm90aW9uIG9mIG1l
ZGlhdGVkIGRldmljZXMsIHN1Y2ggdGhhdCBpdCBrbm93cyB0aGUgbWRldiAKPj4+IHJlcHJlc2Vu
dHMgdGhlIFBBU0lELCBhbmQgY2FuIHJlY29nbmlzZSB0aGUgbWRldiBhdHRhY2ggaXMgZXF1aXZh
bGVudCAKPj4+IHRvIHRoZSBlYXJsaWVyIHBhcmVudCBhdXggYXR0YWNoIHNvIG5vdCBqdXN0IGJs
aW5kbHkgaGFuZCBpdCBkb3duIHRvIAo+Pj4gYW4gSU9NTVUgZHJpdmVyIHRoYXQncyBuZXZlciBo
ZWFyZCBvZiB0aGlzIG5ldyBkZXZpY2UgYmVmb3JlLiBPciAKPj4+IHBlcmhhcHMgdGhlIElPTU1V
IGRyaXZlcnMgZG8gdGhlaXIgb3duIGJvb2trZWVwaW5nIGZvciB0aGUgbWRldiBidXMsIAo+Pj4g
c3VjaCB0aGF0IHRoZXkgZG8gaGFuZGxlIHRoZSBhdHRhY2ggY2FsbCwgYW5kIGp1c3QgdmFsaWRh
dGUgaXQgCj4+PiBpbnRlcm5hbGx5IGJhc2VkIG9uIHRoZSBhc3NvY2lhdGVkIHBhcmVudCBkZXZp
Y2UgYW5kIFBBU0lELiBFaXRoZXIgCj4+PiB3YXksIHRoZSBpbnNpZGUgbWFpbnRhaW5zIHNlbGYt
Y29uc2lzdGVuY3kgYW5kIGZyb20gdGhlIG91dHNpZGUgaXQgCj4+PiBsb29rcyBsaWtlIHN0YW5k
YXJkIEFQSSB1c2FnZSB3aXRob3V0IG5hc3R5IGhhY2tzLgo+Pj4KPj4+IEknbSBwcmV0dHkgc3Vy
ZSBJJ3ZlIGhlYXJkIHN1Z2dlc3Rpb25zIG9mIHVzaW5nIG1lZGlhdGVkIGRldmljZXMgCj4+PiBi
ZXlvbmQgVkZJTyAoZS5nLiB3aXRoaW4gdGhlIGtlcm5lbCBpdHNlbGYpLCBzbyBjaGFuY2VzIGFy
ZSB0aGlzIGlzIGEgCj4+PiBkaXJlY3Rpb24gdGhhdCB3ZSdsbCBoYXZlIHRvIHRha2UgYXQgc29t
ZSBwb2ludCBhbnl3YXkuCj4+Pgo+Pj4gQW5kLCB0aGF0IHNhaWQsIGV2ZW4gaWYgcGVvcGxlIGRv
IHdhbnQgYW4gaW1tZWRpYXRlIHF1aWNrIGZpeCAKPj4+IHJlZ2FyZGxlc3Mgb2YgdGVjaG5pY2Fs
IGRlYnQsIEknZCBzdGlsbCBiZSBhIGxvdCBoYXBwaWVyIHRvIHNlZSAKPj4+IGlvbW11X2dyb3Vw
X3NldF9kb21haW4oKSBsaWdodGx5IHJlc3B1biBhcyBpb21tdV9hdHRhY2hfbWRldigpIDspCj4+
Cj4+IEdldCB5b3VyIHBvaW50IGFuZCBJIGFncmVlIHdpdGggeW91ciBjb25jZXJucy4KPj4KPj4g
VG8gbWFpbnRhaW4gdGhlIHJlbGF0aW9uc2hpcCBiZXR3ZWVuIG1kZXYncyBpb21tdV9ncm91cCBh
bmQKPj4gaW9tbXVfZG9tYWluLCBob3cgYWJvdXQgZXh0ZW5kaW5nIGJlbG93IGV4aXN0aW5nIGF1
eF9hdHRhY2ggYXBpCj4+Cj4+IGludCBpb21tdV9hdXhfYXR0YWNoX2RldmljZShzdHJ1Y3QgaW9t
bXVfZG9tYWluICpkb21haW4sCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0
cnVjdCBkZXZpY2UgKmRldikKPj4KPj4gYnkgYWRkaW5nIHRoZSBtZGV2J3MgaW9tbXVfZ3JvdXA/
Cj4+Cj4+IGludCBpb21tdV9hdXhfYXR0YWNoX2RldmljZShzdHJ1Y3QgaW9tbXVfZG9tYWluICpk
b21haW4sCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBkZXZpY2Ug
KmRldiwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGlvbW11X2dy
b3VwICpncm91cCkKPj4KPj4gQW5kLCBpbiBpb21tdV9hdXhfYXR0YWNoX2RldmljZSgpLCB3ZSBy
ZXF1aXJlLAo+PiDCoMKgLSBAZ3JvdXAgb25seSBoYXMgYSBzaW5nbGUgZGV2aWNlOwo+PiDCoMKg
LSBAZ3JvdXAgaGFzbid0IGJlZW4gYXR0YWNoZWQgYnkgYW55IGRldmljZXM7Cj4+IMKgwqAtIFNl
dCB0aGUgQGRvbWFpbiB0byBAZ3JvdXAKPj4KPj4gSnVzdCBsaWtlIHdoYXQgd2UndmUgZG9uZSBp
biBpb21tdV9hdHRhY2hfZGV2aWNlKCkuCj4+Cj4+IEFueSB0aG91Z2h0cz8KPiAKPiBSYXRoZXIg
dGhhbiBwYXNzIGEgYmFyZSBpb21tdV9ncm91cCB3aXRoIGltcGxpY2l0IHJlc3RyaWN0aW9ucywg
aXQgbWlnaHQgCj4gYmUgbmVhdGVyIHRvIGp1c3QgcGFzcyBhbiBtZGV2X2RldmljZSwgc28gdGhh
dCB0aGUgSU9NTVUgY29yZSBjYW4gYWxzbyAKPiB0YWtlIGNhcmUgb2YgYWxsb2NhdGluZyBhbmQg
c2V0dGluZyB1cCB0aGUgZ3JvdXAuIFRoZW4gd2UgZmxhZyB0aGUgZ3JvdXAgCj4gaW50ZXJuYWxs
eSBhcyBhIHNwZWNpYWwgIm1kZXYgZ3JvdXAiIHN1Y2ggdGhhdCB3ZSBjYW4gcHJldmVudCBjYWxs
ZXJzIAo+IGZyb20gc3Vic2VxdWVudGx5IHRyeWluZyB0byBhZGQvcmVtb3ZlIGRldmljZXMgb3Ig
YXR0YWNoL2RldGFjaCBpdHMgCj4gZG9tYWluIGRpcmVjdGx5LiBUaGF0IHNlZW1zIGxpa2UgaXQg
d291bGQgbWFrZSBhIHByZXR0eSBzdHJhaWdodGZvcndhcmQgCj4gYW5kIHJvYnVzdCBBUEkgZXh0
ZW5zaW9uLCBhcyBsb25nIGFzIHRoZSBtZGV2IGFyZ3VtZW50IGhlcmUgaXMgb3B0aW9uYWwgCj4g
c28gdGhhdCBTVkEgYW5kIG90aGVyIGF1eCB1c2VycyBkb24ndCBoYXZlIHRvIGNhcmUuIE90aGVy
IHRoYW4gdGhlIAo+IHNsaWdodGx5IGRpZmZlcmVudCBvcmRlcmluZyB3aGVyZSBjYWxsZXIgd291
bGQgaGF2ZSB0byBhbGxvY2F0ZSB0aGUgbWRldiAKPiBmaXJzdCwgdGhlbiBmaW5pc2ggaXQncyBQ
QVNJRC1iYXNlZCBjb25maWd1cmF0aW9uIGFmdGVyd2FyZHMsIEkgZ3Vlc3MgCj4gaXQncyBub3Qg
ZmFyIG9mZiB3aGF0IEkgd2FzIHRoaW5raW5nIHllc3RlcmRheSA6KQoKSGkgQWxleCwgSm9lcmcg
YW5kIG90aGVycywgYW55IGNvbW1lbnRzIGhlcmU/CgpCZXN0IHJlZ2FyZHMsCmJhb2x1Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlvbW11IG1haWxpbmcg
bGlzdAppb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4
Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9pb21tdQ==
