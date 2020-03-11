Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id B61DB181D8A
	for <lists.iommu@lfdr.de>; Wed, 11 Mar 2020 17:15:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5E90888ED7;
	Wed, 11 Mar 2020 16:15:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YYecTYtzX8+j; Wed, 11 Mar 2020 16:15:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 186B78915B;
	Wed, 11 Mar 2020 16:15:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F2FA0C0177;
	Wed, 11 Mar 2020 16:15:37 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A65BBC0177
 for <iommu@lists.linux-foundation.org>; Wed, 11 Mar 2020 16:15:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 945BF876D7
 for <iommu@lists.linux-foundation.org>; Wed, 11 Mar 2020 16:15:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S4pu8xOeqYV6 for <iommu@lists.linux-foundation.org>;
 Wed, 11 Mar 2020 16:15:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by whitealder.osuosl.org (Postfix) with ESMTP id 81E0A8757F
 for <iommu@lists.linux-foundation.org>; Wed, 11 Mar 2020 16:15:35 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0575831B;
 Wed, 11 Mar 2020 09:15:35 -0700 (PDT)
Received: from [10.1.196.37] (e121345-lin.cambridge.arm.com [10.1.196.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F05E03F6CF;
 Wed, 11 Mar 2020 09:15:33 -0700 (PDT)
Subject: Re: [Bug 206175] Fedora >= 5.4 kernels instantly freeze on boot
 without producing any display output
To: "Artem S. Tashkinov" <aros@gmx.com>, Christoph Hellwig <hch@lst.de>
References: <bug-206175-5873@https.bugzilla.kernel.org/>
 <bug-206175-5873-S6PaNNClEr@https.bugzilla.kernel.org/>
 <CAHk-=wi4GS05j67V0D_cRXRQ=_Jh-NT0OuNpF-JFsDFj7jZK9A@mail.gmail.com>
 <20200310162342.GA4483@lst.de>
 <CAHk-=wgB2YMM6kw8W0wq=7efxsRERL14OHMOLU=Nd1OaR+sXvw@mail.gmail.com>
 <20200310182546.GA9268@lst.de> <20200311152453.GB23704@lst.de>
 <e70dd793-e8b8-ab0c-6027-6c22b5a99bfc@gmx.com>
 <20200311154328.GA24044@lst.de> <20200311154718.GB24044@lst.de>
 <962693d9-b595-c44d-1390-e044f29e91d3@gmx.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <eadd21f1-c618-9523-fa14-e862dfa256ac@arm.com>
Date: Wed, 11 Mar 2020 16:15:31 +0000
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <962693d9-b595-c44d-1390-e044f29e91d3@gmx.com>
Content-Language: en-GB
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 iommu@lists.linux-foundation.org,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org
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

T24gMTEvMDMvMjAyMCA0OjAyIHBtLCBBcnRlbSBTLiBUYXNoa2lub3Ygd3JvdGU6Cj4gT24gMy8x
MS8yMCAzOjQ3IFBNLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPj4gQW5kIGFjdHVhbGx5IG9u
ZSBtb3JlIGlkZWEgYWZ0ZXIgbG9va2luZyBhdCB3aGF0IHNsYWIgaW50ZXJhY3Rpb25zCj4+IGNv
dWxkIGV4aXN0LsKgIHBsYXRmb3JtX2RldmljZV9yZWdpc3Rlcl9mdWxsIGZyZWVzIHRoZSBkbWFf
bWFzawo+PiB1bmNvbmRpdGlvbmFsbHksIGV2ZW4gaWYgaXQgZGlkbid0IGFsbG9jYXRlZCBpdCwg
d2hpY2ggbWlnaHQgbGVhZAo+PiB0byB3ZWlyZCBtZW1vcnkgY29ycnVwdGlvbiBpZiB3ZSBoaXQg
dGhlIGZhaWx1cmUgcGF0aC7CoCBTbyBsZXQncyB0cnkKPj4gc29tZXRoaW5nIGxpa2UgdGhpcywg
cmVwbGFjaW5nIHRoZSBlYXJsaWVyIHBhdGNoIGluIHRoYXQgZmlsZS4KPj4KPj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvYmFzZS9wbGF0Zm9ybS5jIGIvZHJpdmVycy9iYXNlL3BsYXRmb3JtLmMKPj4g
aW5kZXggYjIzMGJlYjZjY2I0Li4wNDA4MGE4ZDk0ZTIgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMv
YmFzZS9wbGF0Zm9ybS5jCj4+ICsrKyBiL2RyaXZlcnMvYmFzZS9wbGF0Zm9ybS5jCj4+IEBAIC02
MzIsMTkgKzYzMiw2IEBAIHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgCj4+ICpwbGF0Zm9ybV9kZXZp
Y2VfcmVnaXN0ZXJfZnVsbCgKPj4gwqDCoMKgwqDCoCBwZGV2LT5kZXYub2Zfbm9kZV9yZXVzZWQg
PSBwZGV2aW5mby0+b2Zfbm9kZV9yZXVzZWQ7Cj4+Cj4+IMKgwqDCoMKgwqAgaWYgKHBkZXZpbmZv
LT5kbWFfbWFzaykgewo+PiAtwqDCoMKgwqDCoMKgwqAgLyoKPj4gLcKgwqDCoMKgwqDCoMKgwqAg
KiBUaGlzIG1lbW9yeSBpc24ndCBmcmVlZCB3aGVuIHRoZSBkZXZpY2UgaXMgcHV0LAo+PiAtwqDC
oMKgwqDCoMKgwqDCoCAqIEkgZG9uJ3QgaGF2ZSBhIG5pY2UgaWRlYSBmb3IgdGhhdCB0aG91Z2gu
wqAgQ29uY2VwdHVhbGx5Cj4+IC3CoMKgwqDCoMKgwqDCoMKgICogZG1hX21hc2sgaW4gc3RydWN0
IGRldmljZSBzaG91bGQgbm90IGJlIGEgcG9pbnRlci4KPj4gLcKgwqDCoMKgwqDCoMKgwqAgKiBT
ZWUgaHR0cDovL3RocmVhZC5nbWFuZS5vcmcvZ21hbmUubGludXgua2VybmVsLnBjaS85MDgxCj4+
IC3CoMKgwqDCoMKgwqDCoMKgICovCj4+IC3CoMKgwqDCoMKgwqDCoCBwZGV2LT5kZXYuZG1hX21h
c2sgPQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBrbWFsbG9jKHNpemVvZigqcGRldi0+ZGV2
LmRtYV9tYXNrKSwgR0ZQX0tFUk5FTCk7Cj4+IC3CoMKgwqDCoMKgwqDCoCBpZiAoIXBkZXYtPmRl
di5kbWFfbWFzaykKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBlcnI7Cj4+IC0KPj4g
LcKgwqDCoMKgwqDCoMKgIGttZW1sZWFrX2lnbm9yZShwZGV2LT5kZXYuZG1hX21hc2spOwo+PiAt
Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCAqcGRldi0+ZGV2LmRtYV9tYXNrID0gcGRldmluZm8tPmRt
YV9tYXNrOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcGRldi0+ZGV2LmNvaGVyZW50X2RtYV9tYXNr
ID0gcGRldmluZm8tPmRtYV9tYXNrOwo+PiDCoMKgwqDCoMKgIH0KPj4gQEAgLTY3MCw3ICs2NTcs
NiBAQCBzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlIAo+PiAqcGxhdGZvcm1fZGV2aWNlX3JlZ2lzdGVy
X2Z1bGwoCj4+IMKgwqDCoMKgwqAgaWYgKHJldCkgewo+PiDCoCBlcnI6Cj4+IMKgwqDCoMKgwqDC
oMKgwqDCoCBBQ1BJX0NPTVBBTklPTl9TRVQoJnBkZXYtPmRldiwgTlVMTCk7Cj4+IC3CoMKgwqDC
oMKgwqDCoCBrZnJlZShwZGV2LT5kZXYuZG1hX21hc2spOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqAg
cGxhdGZvcm1fZGV2aWNlX3B1dChwZGV2KTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBF
UlJfUFRSKHJldCk7Cj4+IMKgwqDCoMKgwqAgfQo+Pgo+IAo+IFdpdGggdGhpcyBwYXRjaCB0aGUg
c3lzdGVtIHdvcmtzIChJIGhhdmVuJ3QgY3JlYXRlZCBhbiBpbml0cmQsIHNvIGl0Cj4gZG9lc24n
dCBjb21wbGV0ZWx5IGJvb3QgYW5kIHBhbmljcyBvbiBub3QgYmVpbmcgYWJsZSB0byBtb3VudCBy
b290IGZzCj4gYnV0IHRoYXQncyBleHBlY3RlZCkuCgpZdXAsIGEgZmV3IGxpbmVzIGVhcmxpZXIg
aW4gdGhlIGxvZyB5b3UgY2FuIHNlZSB0aGUgd2RhdF93ZHQgZHJpdmVyIApmYWlsaW5nIGluIHBs
YXRmb3JtX2RldmljZV9hZGQoKSwgd2hpY2ggc2luY2UgaXQgY2FsbGVkIGludG8gCnBsYXRmb3Jt
X2RldmljZV9yZWdpc3Rlcl9mdWxsKCkgd2l0aCBwZGV2aW5mby5kbWFfbWFzayA9IDAsIHdpbGwg
aGF2ZSAKdW53b3VuZCBpbnRvIHRoYXQga2ZyZWUoKSBvZiBwZGV2LmRtYV9tYXNrIGNvcnJ1cHRp
bmcgdGhlIGhlYXAuCgpSb2Jpbi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KaW9tbXUgbWFpbGluZyBsaXN0CmlvbW11QGxpc3RzLmxpbnV4LWZvdW5kYXRp
b24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2lvbW11
