Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E2423B220
	for <lists.iommu@lfdr.de>; Tue,  4 Aug 2020 03:12:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 5457921563;
	Tue,  4 Aug 2020 01:12:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TAn9R3+DHTou; Tue,  4 Aug 2020 01:12:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 29E3921561;
	Tue,  4 Aug 2020 01:12:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E0AADC088E;
	Tue,  4 Aug 2020 01:12:05 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 822DAC004C
 for <iommu@lists.linux-foundation.org>; Tue,  4 Aug 2020 01:12:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 6B71C21561
 for <iommu@lists.linux-foundation.org>; Tue,  4 Aug 2020 01:12:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TURMmehKPdWv for <iommu@lists.linux-foundation.org>;
 Tue,  4 Aug 2020 01:12:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by silver.osuosl.org (Postfix) with ESMTPS id 80FE6204F1
 for <iommu@lists.linux-foundation.org>; Tue,  4 Aug 2020 01:12:01 +0000 (UTC)
IronPort-SDR: eAZe/EJa/RjyhYN8WrDtPl39UBSg1z+zqJuwH9ZBCagRTjDS1k9V22Sxb52wt5pNxTK6JbFH60
 G7T9VcVni+Pg==
X-IronPort-AV: E=McAfee;i="6000,8403,9702"; a="151456691"
X-IronPort-AV: E=Sophos;i="5.75,432,1589266800"; d="scan'208";a="151456691"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2020 18:12:00 -0700
IronPort-SDR: Vh4lTz+vBQH6Hfp5mgwGjftKl90llLCIFo1T27SZnaGNN94EuuKr++iKN/9QUV7uCkChEKLQeT
 CxEEiGYF4tqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,432,1589266800"; d="scan'208";a="288357417"
Received: from xfang4x-mobl1.ccr.corp.intel.com (HELO [10.254.209.94])
 ([10.254.209.94])
 by orsmga003.jf.intel.com with ESMTP; 03 Aug 2020 18:11:57 -0700
Subject: =?UTF-8?B?UmU6IOetlOWkjTog562U5aSNOiDnrZTlpI06IFtQQVRDSF0gaW9tbXUv?=
 =?UTF-8?Q?vt-d=3aAdd_support_for_ACPI_device_in_RMRR?=
To: FelixCui-oc <FelixCui-oc@zhaoxin.com>, Joerg Roedel <joro@8bytes.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 David Woodhouse <dwmw2@infradead.org>
References: <20200802100735.2722-1-FelixCui-oc@zhaoxin.com>
 <73d4a1e4-f6b7-efb0-e225-2e462c838657@linux.intel.com>
 <f6759b9bb2594026b58f9a89e3ce9dc6@zhaoxin.com>
 <9f64d9b6-16e8-73ce-2186-9d8ba49c39f4@linux.intel.com>
 <44ff8f73fa1f49a183a1d8d6d9c2213c@zhaoxin.com>
 <314679b4-7653-041b-9310-73baf8117766@linux.intel.com>
 <1aea042a1b524ef88e491ca2a6d95fb7@zhaoxin.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <36da53a6-00e2-1be1-91b5-d90906a6199f@linux.intel.com>
Date: Tue, 4 Aug 2020 09:11:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <1aea042a1b524ef88e491ca2a6d95fb7@zhaoxin.com>
Content-Language: en-US
Cc: CobeChen-oc <CobeChen-oc@zhaoxin.com>
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

SGkgRmVsaXgsCgpPbiAyMDIwLzgvMyAxNzo0MSwgRmVsaXhDdWktb2Mgd3JvdGU6Cj4gSGkgYmFv
bHUsCj4gCQkgZG1hcl9hY3BpX2Rldl9zY29wZV9pbml0KCkgcGFyc2UgQU5ERCBzdHJ1Y3R1cmUg
YW5kIGVudW1lcmF0ZWQgbmFtZXNwYWNlcyBkZXZpY2UgaW4gRFJIRC4KClllcy4KCj4gCQkgQnV0
IHRoZSBuYW1lc3BhY2UgZGV2aWNlIGluIFJNUlIgaXMgbm90IGVudW1lcmF0ZWQsIHJpZ2h0PwoK
SXQgc2hvdWxkIGJlIHByb2JlZCBpbiBwcm9iZV9hY3BpX25hbWVzcGFjZV9kZXZpY2VzKCkuCgpC
ZXN0IHJlZ2FyZHMsCmJhb2x1Cgo+IAo+IEJlc3QgcmVnYXJkcwo+IEZlbGl4IGN1aS1vYwo+IAo+
IAo+IAo+IAo+IC0tLS0t6YKu5Lu25Y6f5Lu2LS0tLS0KPiDlj5Hku7bkuro6IEZlbGl4Q3VpLW9j
Cj4g5Y+R6YCB5pe26Ze0OiAyMDIw5bm0OOaciDPml6UgMTc6MDIKPiDmlLbku7bkuro6ICdMdSBC
YW9sdScgPGJhb2x1Lmx1QGxpbnV4LmludGVsLmNvbT47IEpvZXJnIFJvZWRlbCA8am9yb0A4Ynl0
ZXMub3JnPjsgaW9tbXVAbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmc7IGxpbnV4LWtlcm5lbEB2
Z2VyLmtlcm5lbC5vcmc7IERhdmlkIFdvb2Rob3VzZSA8ZHdtdzJAaW5mcmFkZWFkLm9yZz4KPiDm
ioTpgIE6IFJheW1vbmRQYW5nLW9jIDxSYXltb25kUGFuZy1vY0B6aGFveGluLmNvbT47IENvYmVD
aGVuLW9jIDxDb2JlQ2hlbi1vY0B6aGFveGluLmNvbT4KPiDkuLvpopg6IOetlOWkjTog562U5aSN
OiDnrZTlpI06IFtQQVRDSF0gaW9tbXUvdnQtZDpBZGQgc3VwcG9ydCBmb3IgQUNQSSBkZXZpY2Ug
aW4gUk1SUgo+IAo+IEhpICBiYW9sdToKPiAJCSJUaGUgbmFtZXNwYWNlIGRldmljZXMgYXJlIGVu
dW1lcmF0ZWQgaW4gcHJvYmVfYWNwaV9uYW1lc3BhY2VfZGV2aWNlcygpLgo+IAkJSXQgY2FsbHMg
aW9tbXVfcHJvYmVfZGV2aWNlKCkgdG8gcHJvY2VzcyB0aGUgZW51bWVyYXRpb24gYW5kIHNldHVw
IHRoZSBpZGVudGl0eSBtYXBwaW5ncy4iCj4gCQkKPiAJCVRoaXMgc2l0dWF0aW9uIG9ubHkgYXBw
bGllcyB0byB0aGUgcGh5c2ljYWwgbm9kZSBvZiB0aGUgbmFtZXNwYWNlcyBkZXZpY2UgYXMgdGhl
IHBjaSBkZXZpY2UuCj4gCQlJbiBmYWN0LCB0aGUgcGh5c2ljYWwgbm9kZSBvZiB0aGUgbmFtZXNw
YWNlcyBkZXZpY2UgY2FuIGJlIGEgcGxhdGZvcm0gZGV2aWNlIG9yIE5VTEwuCj4gCQlJZiB0aGUg
cGh5c2ljYWwgbm9kZSBvZiB0aGUgbmFtZXNwYWNlcyBpcyBhIHBsYXRmb3JtIGRldmljZSBvciBO
VUxMLCBpdCBoYXMgbm90IGFjdHVhbGx5IGJlZW4gZW51bWVyYXRlZC4KPiAJCVNvIGl0IGlzIG5l
Y2Vzc2FyeSB0byBpbmNyZWFzZSB0aGUgYW5hbHlzaXMgb2YgdGhlIG5hbWVzcGFjZXMgZGV2aWNl
IGluIFJNUlIgYW5kIGVzdGFibGlzaCBhbiBpZGVudGl0eSBtYXBwaW5nLgo+IAo+IEJlc3QgcmVn
YXJkcwo+IEZlbGl4IGN1aQo+IAo+IAo+IAo+IAo+IC0tLS0t6YKu5Lu25Y6f5Lu2LS0tLS0KPiDl
j5Hku7bkuro6IEx1IEJhb2x1IDxiYW9sdS5sdUBsaW51eC5pbnRlbC5jb20+Cj4g5Y+R6YCB5pe2
6Ze0OiAyMDIw5bm0OOaciDPml6UgMTY6MjYKPiDmlLbku7bkuro6IEZlbGl4Q3VpLW9jIDxGZWxp
eEN1aS1vY0B6aGFveGluLmNvbT47IEpvZXJnIFJvZWRlbCA8am9yb0A4Ynl0ZXMub3JnPjsgaW9t
bXVAbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5v
cmc7IERhdmlkIFdvb2Rob3VzZSA8ZHdtdzJAaW5mcmFkZWFkLm9yZz4KPiDmioTpgIE6IGJhb2x1
Lmx1QGxpbnV4LmludGVsLmNvbTsgUmF5bW9uZFBhbmctb2MgPFJheW1vbmRQYW5nLW9jQHpoYW94
aW4uY29tPjsgQ29iZUNoZW4tb2MgPENvYmVDaGVuLW9jQHpoYW94aW4uY29tPgo+IOS4u+mimDog
UmU6IOetlOWkjTog562U5aSNOiBbUEFUQ0hdIGlvbW11L3Z0LWQ6QWRkIHN1cHBvcnQgZm9yIEFD
UEkgZGV2aWNlIGluIFJNUlIKPiAKPiBPbiAyMDIwLzgvMyAxNDo1MiwgRmVsaXhDdWktb2Mgd3Jv
dGU6Cj4+IEhpICBiYW9sdSAsCj4+IAkJWWVzICx0aGF0J3MgcmlnaHQuCj4+IAkJVGhpcyBwYXRj
aCBpcyB0byBhY2hpZXZlIGFjcGkgbmFtZXNwYWNlIGRldmljZXMgdG8gYWNjZXNzIHRoZSBSTVJS
IHJlZ2lvbi4KPiAKPiBUaGUgbmFtZXNwYWNlIGRldmljZXMgYXJlIGVudW1lcmF0ZWQgaW4gcHJv
YmVfYWNwaV9uYW1lc3BhY2VfZGV2aWNlcygpLgo+IEl0IGNhbGxzIGlvbW11X3Byb2JlX2Rldmlj
ZSgpIHRvIHByb2Nlc3MgdGhlIGVudW1lcmF0aW9uIGFuZCBzZXR1cCB0aGUgaWRlbnRpdHkgbWFw
cGluZ3MuIENhbiB5b3UgcGxlYXNlIGNoZWNrIHdoeSB0aGF0IGNvZGUgZG9lc24ndCB3b3JrIGZv
ciB5b3U/Cj4gCj4gQmVzdCByZWdhcmRzLAo+IGJhb2x1Cj4gCj4+Cj4+IEJlc3QgcmVnYXJkcwo+
PiBGZWxpeCBjdWkKPj4KPj4KPj4KPj4KPj4gLS0tLS3pgq7ku7bljp/ku7YtLS0tLQo+PiDlj5Hk
u7bkuro6IEx1IEJhb2x1IDxiYW9sdS5sdUBsaW51eC5pbnRlbC5jb20+Cj4+IOWPkemAgeaXtumX
tDogMjAyMOW5tDjmnIgz5pelIDE0OjE5Cj4+IOaUtuS7tuS6ujogRmVsaXhDdWktb2MgPEZlbGl4
Q3VpLW9jQHpoYW94aW4uY29tPjsgSm9lcmcgUm9lZGVsCj4+IDxqb3JvQDhieXRlcy5vcmc+OyBp
b21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZzsKPj4gbGludXgta2VybmVsQHZnZXIua2Vy
bmVsLm9yZzsgRGF2aWQgV29vZGhvdXNlIDxkd213MkBpbmZyYWRlYWQub3JnPgo+PiDmioTpgIE6
IGJhb2x1Lmx1QGxpbnV4LmludGVsLmNvbTsgUmF5bW9uZFBhbmctb2MKPj4gPFJheW1vbmRQYW5n
LW9jQHpoYW94aW4uY29tPjsgQ29iZUNoZW4tb2MgPENvYmVDaGVuLW9jQHpoYW94aW4uY29tPgo+
PiDkuLvpopg6IFJlOiDnrZTlpI06IFtQQVRDSF0gaW9tbXUvdnQtZDpBZGQgc3VwcG9ydCBmb3Ig
QUNQSSBkZXZpY2UgaW4gUk1SUgo+Pgo+PiBIaSwKPj4KPj4gT24gMjAyMC84LzMgMTI6NDAsIEZl
bGl4Q3VpLW9jIHdyb3RlOgo+Pj4gSGkgYmFvbHU6Cj4+PiAJCVNvbWUgQUNQSSBkZXZpY2VzIG5l
ZWQgdG8gaXNzdWUgZG1hIHJlcXVlc3RzIHRvIGFjY2VzcyB0aGUgcmVzZXJ2ZWQgbWVtb3J5IGFy
ZWEuCj4+PiAJCVNvIGJpb3MgdXNlcyB0aGUgZGV2aWNlIHNjb3BlIHR5cGUgQUNQSV9OQU1FU1BB
Q0VfREVWSUNFIGluIFJNUlIgdG8gcmVwb3J0IHRoZXNlIEFDUEkgZGV2aWNlcy4KPj4+IAkJQXQg
cHJlc2VudCwgdGhlcmUgaXMgbm8gYW5hbHlzaXMgaW4gdGhlIGtlcm5lbCB0aGF0IHRoZSBkZXZp
Y2Ugc2NvcGUgdHlwZSBpbiBSTVJSIGlzIEFDUElfTkFNRVNQQUNFX0RFVklDRS4KPj4+IAkJVGhp
cyBwYXRjaCBpcyBtYWlubHkgdG8gYWRkIHRoZSBhbmFseXNpcyBvZiB0aGUgZGV2aWNlIHNjb3Bl
IHR5cGUgQUNQSV9OQU1FU1BBQ0VfREVWSUNFIGluIFJNUlIgc3RydWN0dXJlIGFuZCBlc3RhYmxp
c2ggaWRlbnRpdHkgbWFwcGluZyBmb3IgPiB0aGVzZSBBQ1BJIGRldmljZXMuCj4+Cj4+IFNvIHRo
ZSBwcm9ibGVtIGlzICJhbHRob3VnaCBuYW1lc3BhY2UgZGV2aWNlcyBpbiBSTVJSIGhhdmUgYmVl
biBwYXJzZWQsIGJ1dCB0aGUgaWRlbnRpdHkgbWFwIGZvciB0aG9zZSBkZXZpY2VzIGFyZW4ndCBj
cmVhdGVkLiBBcyB0aGUgcmVzdWx0LCB0aGUgbmFtZXNwYWNlIGRldmljZXMgZmFpbCB0byBhY2Nl
c3MgdGhlIFJNUlIgcmVnaW9uLiIKPj4KPj4gRG8gSSB1bmRlcnN0YW5kIGl0IHJpZ2h0Pwo+Pgo+
PiBCZXN0IHJlZ2FyZHMsCj4+IGJhb2x1Cj4+Cj4+PiBJbiBhZGRpdGlvbiwgc29tZSBuYW1pbmcg
Y2hhbmdlcyBoYXZlIGJlZW4gbWFkZSBpbiBwYXRjaCBpbiBvcmRlciB0byBkaXN0aW5ndWlzaCBh
Y3BpIGRldmljZSBmcm9tIHBjaSBkZXZpY2UuCj4+PiAJCVlvdSBjYW4gcmVmZXIgdG8gdGhlIGRl
c2NyaXB0aW9uIG9mIHR5cGUgaW4gOC4zLjEgZGV2aWNlIHNjb3BlIGluIHZ0LWQgc3BlYy4KPj4+
Cj4+PiBCZXN0IHJlZ2FyZHMKPj4+IEZlbGl4Q3VpLW9jCj4+Pgo+Pj4KPj4+Cj4+PiAtLS0tLemC
ruS7tuWOn+S7ti0tLS0tCj4+PiDlj5Hku7bkuro6IEx1IEJhb2x1IDxiYW9sdS5sdUBsaW51eC5p
bnRlbC5jb20+Cj4+PiDlj5HpgIHml7bpl7Q6IDIwMjDlubQ45pyIM+aXpSAxMDozMgo+Pj4g5pS2
5Lu25Lq6OiBGZWxpeEN1aS1vYyA8RmVsaXhDdWktb2NAemhhb3hpbi5jb20+OyBKb2VyZyBSb2Vk
ZWwKPj4+IDxqb3JvQDhieXRlcy5vcmc+OyBpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9y
ZzsKPj4+IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IERhdmlkIFdvb2Rob3VzZSA8ZHdt
dzJAaW5mcmFkZWFkLm9yZz4KPj4+IOaKhOmAgTogYmFvbHUubHVAbGludXguaW50ZWwuY29tOyBD
b2JlIENoZW4oQkotUkQpCj4+PiA8Q29iZUNoZW5Aemhhb3hpbi5jb20+OyBSYXltb25kIFBhbmco
QkotUkQpIDxSYXltb25kUGFuZ0B6aGFveGluLmNvbT4KPj4+IOS4u+mimDogUmU6IFtQQVRDSF0g
aW9tbXUvdnQtZDpBZGQgc3VwcG9ydCBmb3IgQUNQSSBkZXZpY2UgaW4gUk1SUgo+Pj4KPj4+IEhp
LAo+Pj4KPj4+IE9uIDgvMi8yMCA2OjA3IFBNLCBGZWxpeEN1aW9jIHdyb3RlOgo+Pj4+IFNvbWUg
QUNQSSBkZXZpY2VzIHJlcXVpcmUgYWNjZXNzIHRvIHRoZSBzcGVjaWZpZWQgcmVzZXJ2ZWQgbWVt
b3J5Cj4+Pj4gcmVnaW9uLkJJT1MgcmVwb3J0IHRoZSBzcGVjaWZpZWQgcmVzZXJ2ZWQgbWVtb3J5
IHJlZ2lvbiB0aHJvdWdoIFJNUlIKPj4+PiBzdHJ1Y3R1cmVzLkFkZCBhbmFseXNpcyBvZiBBQ1BJ
IGRldmljZSBpbiBSTVJSIGFuZCBlc3RhYmxpc2gKPj4+PiBpZGVudGl0eSBtYXBwaW5nIGZvciBB
Q1BJIGRldmljZS4KPj4+Cj4+PiBDYW4geW91IHBsZWFzZSBhZGQgbW9yZSB3b3JkcyBhYm91dCB0
aGUgcHJvYmxlbSB5b3Ugd2FudCB0byBzb2x2ZT8gRG8geW91IG1lYW4gc29tZSBSTVJScyBhcmUg
bm90IGVudW1lcmF0ZWQgY29ycmVjdGx5PyBPciwgZW51bWVyYXRlZCwgYnV0IG5vdCBpZGVudGl0
eSBtYXBwZWQ/Cj4+Pgo+Pj4gTml0OiBhZGQgdmVyc2lvbiBhbmQgY2hhbmdlIGxvZyBvbmNlIHlv
dSByZWZyZXNoZWQgeW91ciBwYXRjaC4KPj4+Cj4+Pj4KPj4+PiBSZXBvcnRlZC1ieToga2VybmVs
IHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+Cj4+Pgo+Pj4gTm8gbmVlZCB0byBhZGQgdGhpcy4g
VGhlIHByb2JsZW0geW91IHdhbnQgdG8gc29sdmUgdGhyb3VnaCB0aGlzIHBhdGNoIGlzIG5vdCBy
ZXBvcnRlZCBieSBsa3AuCj4+Pgo+Pj4gQmVzdCByZWdhcmRzLAo+Pj4gYmFvbHUKPj4+Cj4+Pj4g
U2lnbmVkLW9mZi1ieTogRmVsaXhDdWlvYyA8RmVsaXhDdWktb2NAemhhb3hpbi5jb20+Cj4+Pj4g
LS0tCj4+Pj4gICAgICBkcml2ZXJzL2lvbW11L2ludGVsL2RtYXIuYyAgfCA3NCArKysrKysrKysr
KysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tCj4+Pj4gICAgICBkcml2ZXJzL2lvbW11L2ludGVs
L2lvbW11LmMgfCA0NiArKysrKysrKysrKysrKysrKysrKysrLQo+Pj4+ICAgICAgZHJpdmVycy9p
b21tdS9pb21tdS5jICAgICAgIHwgIDYgKysrCj4+Pj4gICAgICBpbmNsdWRlL2xpbnV4L2RtYXIu
aCAgICAgICAgfCAxMiArKysrKy0KPj4+PiAgICAgIGluY2x1ZGUvbGludXgvaW9tbXUuaCAgICAg
ICB8ICAzICsrCj4+Pj4gICAgICA1IGZpbGVzIGNoYW5nZWQsIDEwNSBpbnNlcnRpb25zKCspLCAz
NiBkZWxldGlvbnMoLSkKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lvbW11L2ludGVs
L2RtYXIuYyBiL2RyaXZlcnMvaW9tbXUvaW50ZWwvZG1hci5jCj4+Pj4gaW5kZXggOTNlNjM0NWYz
NDE0Li4wMjRjYTM4ZGJhMTIgMTAwNjQ0Cj4+Pj4gLS0tIGEvZHJpdmVycy9pb21tdS9pbnRlbC9k
bWFyLmMKPj4+PiArKysgYi9kcml2ZXJzL2lvbW11L2ludGVsL2RtYXIuYwo+Pj4+IEBAIC0yMTUs
NyArMjE1LDcgQEAgc3RhdGljIGJvb2wgZG1hcl9tYXRjaF9wY2lfcGF0aChzdHJ1Y3QgZG1hcl9w
Y2lfbm90aWZ5X2luZm8gKmluZm8sIGludCBidXMsCj4+Pj4gICAgICB9Cj4+Pj4gICAgICAKPj4+
PiAgICAgIC8qIFJldHVybjogPiAwIGlmIG1hdGNoIGZvdW5kLCAwIGlmIG5vIG1hdGNoIGZvdW5k
LCA8IDAgaWYgZXJyb3IKPj4+PiBoYXBwZW5zICovIC1pbnQgZG1hcl9pbnNlcnRfZGV2X3Njb3Bl
KHN0cnVjdCBkbWFyX3BjaV9ub3RpZnlfaW5mbwo+Pj4+ICppbmZvLAo+Pj4+ICtpbnQgZG1hcl9w
Y2lfaW5zZXJ0X2Rldl9zY29wZShzdHJ1Y3QgZG1hcl9wY2lfbm90aWZ5X2luZm8gKmluZm8sCj4+
Pj4gICAgICAJCQkgIHZvaWQgKnN0YXJ0LCB2b2lkKmVuZCwgdTE2IHNlZ21lbnQsCj4+Pj4gICAg
ICAJCQkgIHN0cnVjdCBkbWFyX2Rldl9zY29wZSAqZGV2aWNlcywKPj4+PiAgICAgIAkJCSAgaW50
IGRldmljZXNfY250KQo+Pj4+IEBAIC0zMDQsNyArMzA0LDcgQEAgc3RhdGljIGludCBkbWFyX3Bj
aV9idXNfYWRkX2RldihzdHJ1Y3QKPj4+PiBkbWFyX3BjaV9ub3RpZnlfaW5mbyAqaW5mbykKPj4+
PiAgICAgIAo+Pj4+ICAgICAgCQlkcmhkID0gY29udGFpbmVyX29mKGRtYXJ1LT5oZHIsCj4+Pj4g
ICAgICAJCQkJICAgIHN0cnVjdCBhY3BpX2RtYXJfaGFyZHdhcmVfdW5pdCwgaGVhZGVyKTsKPj4+
PiAtCQlyZXQgPSBkbWFyX2luc2VydF9kZXZfc2NvcGUoaW5mbywgKHZvaWQgKikoZHJoZCArIDEp
LAo+Pj4+ICsJCXJldCA9IGRtYXJfcGNpX2luc2VydF9kZXZfc2NvcGUoaW5mbywgKHZvaWQgKiko
ZHJoZCArIDEpLAo+Pj4+ICAgICAgCQkJCSgodm9pZCAqKWRyaGQpICsgZHJoZC0+aGVhZGVyLmxl
bmd0aCwKPj4+PiAgICAgIAkJCQlkbWFydS0+c2VnbWVudCwKPj4+PiAgICAgIAkJCQlkbWFydS0+
ZGV2aWNlcywgZG1hcnUtPmRldmljZXNfY250KTsgQEAgLTY5Niw0OCArNjk2LDU2IEBACj4+Pj4g
ZG1hcl9maW5kX21hdGNoZWRfZHJoZF91bml0KHN0cnVjdCBwY2lfZGV2ICpkZXYpCj4+Pj4gICAg
ICAKPj4+PiAgICAgIAlyZXR1cm4gZG1hcnU7Cj4+Pj4gICAgICB9Cj4+Pj4gLQo+Pj4+IC1zdGF0
aWMgdm9pZCBfX2luaXQgZG1hcl9hY3BpX2luc2VydF9kZXZfc2NvcGUodTggZGV2aWNlX251bWJl
ciwKPj4+PiAtCQkJCQkgICAgICBzdHJ1Y3QgYWNwaV9kZXZpY2UgKmFkZXYpCj4+Pj4gK2ludCBk
bWFyX2FjcGlfaW5zZXJ0X2Rldl9zY29wZSh1OCBkZXZpY2VfbnVtYmVyLAo+Pj4+ICsJCQkJc3Ry
dWN0IGFjcGlfZGV2aWNlICphZGV2LAo+Pj4+ICsJCQkJdm9pZCAqc3RhcnQsIHZvaWQgKmVuZCwK
Pj4+PiArCQkJCXN0cnVjdCBkbWFyX2Rldl9zY29wZSAqZGV2aWNlcywKPj4+PiArCQkJCWludCBk
ZXZpY2VzX2NudCkKPj4+PiAgICAgIHsKPj4+PiAtCXN0cnVjdCBkbWFyX2RyaGRfdW5pdCAqZG1h
cnU7Cj4+Pj4gLQlzdHJ1Y3QgYWNwaV9kbWFyX2hhcmR3YXJlX3VuaXQgKmRyaGQ7Cj4+Pj4gICAg
ICAJc3RydWN0IGFjcGlfZG1hcl9kZXZpY2Vfc2NvcGUgKnNjb3BlOwo+Pj4+ICAgICAgCXN0cnVj
dCBkZXZpY2UgKnRtcDsKPj4+PiAgICAgIAlpbnQgaTsKPj4+PiAgICAgIAlzdHJ1Y3QgYWNwaV9k
bWFyX3BjaV9wYXRoICpwYXRoOwo+Pj4+ICAgICAgCj4+Pj4gKwlmb3IgKDsgc3RhcnQgPCBlbmQ7
IHN0YXJ0ICs9IHNjb3BlLT5sZW5ndGgpIHsKPj4+PiArCQlzY29wZSA9IHN0YXJ0Owo+Pj4+ICsJ
CWlmIChzY29wZS0+ZW50cnlfdHlwZSAhPSBBQ1BJX0RNQVJfU0NPUEVfVFlQRV9OQU1FU1BBQ0Up
Cj4+Pj4gKwkJCWNvbnRpbnVlOwo+Pj4+ICsJCWlmIChzY29wZS0+ZW51bWVyYXRpb25faWQgIT0g
ZGV2aWNlX251bWJlcikKPj4+PiArCQkJY29udGludWU7Cj4+Pj4gKwkJcGF0aCA9ICh2b2lkICop
KHNjb3BlICsgMSk7Cj4+Pj4gKwkJZm9yX2VhY2hfZGV2X3Njb3BlKGRldmljZXMsIGRldmljZXNf
Y250LCBpLCB0bXApCj4+Pj4gKwkJCWlmICh0bXAgPT0gTlVMTCkgewo+Pj4+ICsJCQkJZGV2aWNl
c1tpXS5idXMgPSBzY29wZS0+YnVzOwo+Pj4+ICsJCQkJZGV2aWNlc1tpXS5kZXZmbiA9IFBDSV9E
RVZGTihwYXRoLT5kZXZpY2UsIHBhdGgtPmZ1bmN0aW9uKTsKPj4+PiArCQkJCXJjdV9hc3NpZ25f
cG9pbnRlcihkZXZpY2VzW2ldLmRldiwKPj4+PiArCQkJCQkJICAgZ2V0X2RldmljZSgmYWRldi0+
ZGV2KSk7Cj4+Pj4gKwkJCQlyZXR1cm4gMTsKPj4+PiArCQkJfQo+Pj4+ICsJCVdBUk5fT04oaSA+
PSBkZXZpY2VzX2NudCk7Cj4+Pj4gKwl9Cj4+Pj4gKwlyZXR1cm4gMDsKPj4+PiArfQo+Pj4+ICtz
dGF0aWMgaW50IGRtYXJfYWNwaV9idXNfYWRkX2Rldih1OCBkZXZpY2VfbnVtYmVyLCBzdHJ1Y3QK
Pj4+PiArYWNwaV9kZXZpY2UKPj4+PiArKmFkZXYpIHsKPj4+PiArCXN0cnVjdCBkbWFyX2RyaGRf
dW5pdCAqZG1hcnU7Cj4+Pj4gKwlzdHJ1Y3QgYWNwaV9kbWFyX2hhcmR3YXJlX3VuaXQgKmRyaGQ7
Cj4+Pj4gKwlpbnQgcmV0ID0gMDsKPj4+PiArCj4+Pj4gICAgICAJZm9yX2VhY2hfZHJoZF91bml0
KGRtYXJ1KSB7Cj4+Pj4gICAgICAJCWRyaGQgPSBjb250YWluZXJfb2YoZG1hcnUtPmhkciwKPj4+
PiAgICAgIAkJCQkgICAgc3RydWN0IGFjcGlfZG1hcl9oYXJkd2FyZV91bml0LAo+Pj4+ICAgICAg
CQkJCSAgICBoZWFkZXIpOwo+Pj4+ICsJCXJldCA9IGRtYXJfYWNwaV9pbnNlcnRfZGV2X3Njb3Bl
KGRldmljZV9udW1iZXIsIGFkZXYsICh2b2lkICopKGRyaGQrMSksCj4+Pj4gKwkJCQkJCSgodm9p
ZCAqKWRyaGQpK2RyaGQtPmhlYWRlci5sZW5ndGgsCj4+Pj4gKwkJCQkJCWRtYXJ1LT5kZXZpY2Vz
LCBkbWFydS0+ZGV2aWNlc19jbnQpOwo+Pj4+ICsJCWlmIChyZXQpCj4+Pj4gKwkJCWJyZWFrOwo+
Pj4+ICsJfQo+Pj4+ICsJcmV0ID0gZG1hcl9ybXJyX2FkZF9hY3BpX2RldihkZXZpY2VfbnVtYmVy
LCBhZGV2KTsKPj4+PiAgICAgIAo+Pj4+IC0JCWZvciAoc2NvcGUgPSAodm9pZCAqKShkcmhkICsg
MSk7Cj4+Pj4gLQkJICAgICAodW5zaWduZWQgbG9uZylzY29wZSA8ICgodW5zaWduZWQgbG9uZylk
cmhkKSArIGRyaGQtPmhlYWRlci5sZW5ndGg7Cj4+Pj4gLQkJICAgICBzY29wZSA9ICgodm9pZCAq
KXNjb3BlKSArIHNjb3BlLT5sZW5ndGgpIHsKPj4+PiAtCQkJaWYgKHNjb3BlLT5lbnRyeV90eXBl
ICE9IEFDUElfRE1BUl9TQ09QRV9UWVBFX05BTUVTUEFDRSkKPj4+PiAtCQkJCWNvbnRpbnVlOwo+
Pj4+IC0JCQlpZiAoc2NvcGUtPmVudW1lcmF0aW9uX2lkICE9IGRldmljZV9udW1iZXIpCj4+Pj4g
LQkJCQljb250aW51ZTsKPj4+PiArCXJldHVybiByZXQ7Cj4+Pj4gICAgICAKPj4+PiAtCQkJcGF0
aCA9ICh2b2lkICopKHNjb3BlICsgMSk7Cj4+Pj4gLQkJCXByX2luZm8oIkFDUEkgZGV2aWNlIFwi
JXNcIiB1bmRlciBETUFSIGF0ICVsbHggYXMgJTAyeDolMDJ4LiVkXG4iLAo+Pj4+IC0JCQkJZGV2
X25hbWUoJmFkZXYtPmRldiksIGRtYXJ1LT5yZWdfYmFzZV9hZGRyLAo+Pj4+IC0JCQkJc2NvcGUt
PmJ1cywgcGF0aC0+ZGV2aWNlLCBwYXRoLT5mdW5jdGlvbik7Cj4+Pj4gLQkJCWZvcl9lYWNoX2Rl
dl9zY29wZShkbWFydS0+ZGV2aWNlcywgZG1hcnUtPmRldmljZXNfY250LCBpLCB0bXApCj4+Pj4g
LQkJCQlpZiAodG1wID09IE5VTEwpIHsKPj4+PiAtCQkJCQlkbWFydS0+ZGV2aWNlc1tpXS5idXMg
PSBzY29wZS0+YnVzOwo+Pj4+IC0JCQkJCWRtYXJ1LT5kZXZpY2VzW2ldLmRldmZuID0gUENJX0RF
VkZOKHBhdGgtPmRldmljZSwKPj4+PiAtCQkJCQkJCQkJICAgIHBhdGgtPmZ1bmN0aW9uKTsKPj4+
PiAtCQkJCQlyY3VfYXNzaWduX3BvaW50ZXIoZG1hcnUtPmRldmljZXNbaV0uZGV2LAo+Pj4+IC0J
CQkJCQkJICAgZ2V0X2RldmljZSgmYWRldi0+ZGV2KSk7Cj4+Pj4gLQkJCQkJcmV0dXJuOwo+Pj4+
IC0JCQkJfQo+Pj4+IC0JCQlCVUdfT04oaSA+PSBkbWFydS0+ZGV2aWNlc19jbnQpOwo+Pj4+IC0J
CX0KPj4+PiAtCX0KPj4+PiAtCXByX3dhcm4oIk5vIElPTU1VIHNjb3BlIGZvdW5kIGZvciBBTkRE
IGVudW1lcmF0aW9uIElEICVkICglcylcbiIsCj4+Pj4gLQkJZGV2aWNlX251bWJlciwgZGV2X25h
bWUoJmFkZXYtPmRldikpOwo+Pj4+ICAgICAgfQo+Pj4+ICAgICAgCj4+Pj4gICAgICBzdGF0aWMg
aW50IF9faW5pdCBkbWFyX2FjcGlfZGV2X3Njb3BlX2luaXQodm9pZCkgQEAgLTc2Niw3Cj4+Pj4g
Kzc3NCw3IEBAIHN0YXRpYyBpbnQgX19pbml0IGRtYXJfYWNwaV9kZXZfc2NvcGVfaW5pdCh2b2lk
KQo+Pj4+ICAgICAgCQkJCSAgICAgICBhbmRkLT5kZXZpY2VfbmFtZSk7Cj4+Pj4gICAgICAJCQkJ
Y29udGludWU7Cj4+Pj4gICAgICAJCQl9Cj4+Pj4gLQkJCWRtYXJfYWNwaV9pbnNlcnRfZGV2X3Nj
b3BlKGFuZGQtPmRldmljZV9udW1iZXIsIGFkZXYpOwo+Pj4+ICsJCQlkbWFyX2FjcGlfYnVzX2Fk
ZF9kZXYoYW5kZC0+ZGV2aWNlX251bWJlciwgYWRldik7Cj4+Pj4gICAgICAJCX0KPj4+PiAgICAg
IAl9Cj4+Pj4gICAgICAJcmV0dXJuIDA7Cj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaW9tbXUv
aW50ZWwvaW9tbXUuYwo+Pj4+IGIvZHJpdmVycy9pb21tdS9pbnRlbC9pb21tdS5jIGluZGV4IGNh
NTU3ZDM1MTUxOC4uYmUxNzkzNDE1MzI2Cj4+Pj4gMTAwNjQ0Cj4+Pj4gLS0tIGEvZHJpdmVycy9p
b21tdS9pbnRlbC9pb21tdS5jCj4+Pj4gKysrIGIvZHJpdmVycy9pb21tdS9pbnRlbC9pb21tdS5j
Cj4+Pj4gQEAgLTQ1MDcsNiArNDUwNywyNCBAQCBpbnQgZG1hcl9maW5kX21hdGNoZWRfYXRzcl91
bml0KHN0cnVjdAo+Pj4+IHBjaV9kZXYKPj4+PiAqZGV2KQo+Pj4+ICAgICAgCj4+Pj4gICAgICAJ
cmV0dXJuIHJldDsKPj4+PiAgICAgIH0KPj4+PiAraW50IGRtYXJfcm1ycl9hZGRfYWNwaV9kZXYo
dTggZGV2aWNlX251bWJlciwgc3RydWN0IGFjcGlfZGV2aWNlCj4+Pj4gKyphZGV2KSB7Cj4+Pj4g
KwlpbnQgcmV0Owo+Pj4+ICsJc3RydWN0IGRtYXJfcm1ycl91bml0ICpybXJydTsKPj4+PiArCXN0
cnVjdCBhY3BpX2RtYXJfcmVzZXJ2ZWRfbWVtb3J5ICpybXJyOwo+Pj4+ICsKPj4+PiArCWxpc3Rf
Zm9yX2VhY2hfZW50cnkocm1ycnUsICZkbWFyX3JtcnJfdW5pdHMsIGxpc3QpIHsKPj4+PiArCQly
bXJyID0gY29udGFpbmVyX29mKHJtcnJ1LT5oZHIsCj4+Pj4gKwkJCQlzdHJ1Y3QgYWNwaV9kbWFy
X3Jlc2VydmVkX21lbW9yeSwKPj4+PiArCQkJCWhlYWRlcik7Cj4+Pj4gKwkJcmV0ID0gZG1hcl9h
Y3BpX2luc2VydF9kZXZfc2NvcGUoZGV2aWNlX251bWJlciwgYWRldiwgKHZvaWQgKikocm1yciAr
IDEpLAo+Pj4+ICsJCQkJCQkoKHZvaWQgKilybXJyKSArIHJtcnItPmhlYWRlci5sZW5ndGgsCj4+
Pj4gKwkJCQkJCXJtcnJ1LT5kZXZpY2VzLCBybXJydS0+ZGV2aWNlc19jbnQpOwo+Pj4+ICsJCWlm
IChyZXQpCj4+Pj4gKwkJCWJyZWFrOwo+Pj4+ICsJfQo+Pj4+ICsJcmV0dXJuIDA7Cj4+Pj4gK30K
Pj4+PiAgICAgIAo+Pj4+ICAgICAgaW50IGRtYXJfaW9tbXVfbm90aWZ5X3Njb3BlX2RldihzdHJ1
Y3QgZG1hcl9wY2lfbm90aWZ5X2luZm8gKmluZm8pCj4+Pj4gICAgICB7Cj4+Pj4gQEAgLTQ1MjMs
NyArNDU0MSw3IEBAIGludCBkbWFyX2lvbW11X25vdGlmeV9zY29wZV9kZXYoc3RydWN0IGRtYXJf
cGNpX25vdGlmeV9pbmZvICppbmZvKQo+Pj4+ICAgICAgCQlybXJyID0gY29udGFpbmVyX29mKHJt
cnJ1LT5oZHIsCj4+Pj4gICAgICAJCQkJICAgIHN0cnVjdCBhY3BpX2RtYXJfcmVzZXJ2ZWRfbWVt
b3J5LCBoZWFkZXIpOwo+Pj4+ICAgICAgCQlpZiAoaW5mby0+ZXZlbnQgPT0gQlVTX05PVElGWV9B
RERfREVWSUNFKSB7Cj4+Pj4gLQkJCXJldCA9IGRtYXJfaW5zZXJ0X2Rldl9zY29wZShpbmZvLCAo
dm9pZCAqKShybXJyICsgMSksCj4+Pj4gKwkJCXJldCA9IGRtYXJfcGNpX2luc2VydF9kZXZfc2Nv
cGUoaW5mbywgKHZvaWQgKikocm1yciArIDEpLAo+Pj4+ICAgICAgCQkJCSgodm9pZCAqKXJtcnIp
ICsgcm1yci0+aGVhZGVyLmxlbmd0aCwKPj4+PiAgICAgIAkJCQlybXJyLT5zZWdtZW50LCBybXJy
dS0+ZGV2aWNlcywKPj4+PiAgICAgIAkJCQlybXJydS0+ZGV2aWNlc19jbnQpOwo+Pj4+IEBAIC00
NTQxLDcgKzQ1NTksNyBAQCBpbnQgZG1hcl9pb21tdV9ub3RpZnlfc2NvcGVfZGV2KHN0cnVjdAo+
Pj4+IGRtYXJfcGNpX25vdGlmeV9pbmZvICppbmZvKQo+Pj4+ICAgICAgCj4+Pj4gICAgICAJCWF0
c3IgPSBjb250YWluZXJfb2YoYXRzcnUtPmhkciwgc3RydWN0IGFjcGlfZG1hcl9hdHNyLCBoZWFk
ZXIpOwo+Pj4+ICAgICAgCQlpZiAoaW5mby0+ZXZlbnQgPT0gQlVTX05PVElGWV9BRERfREVWSUNF
KSB7Cj4+Pj4gLQkJCXJldCA9IGRtYXJfaW5zZXJ0X2Rldl9zY29wZShpbmZvLCAodm9pZCAqKShh
dHNyICsgMSksCj4+Pj4gKwkJCXJldCA9IGRtYXJfcGNpX2luc2VydF9kZXZfc2NvcGUoaW5mbywg
KHZvaWQgKikoYXRzciArIDEpLAo+Pj4+ICAgICAgCQkJCQkodm9pZCAqKWF0c3IgKyBhdHNyLT5o
ZWFkZXIubGVuZ3RoLAo+Pj4+ICAgICAgCQkJCQlhdHNyLT5zZWdtZW50LCBhdHNydS0+ZGV2aWNl
cywKPj4+PiAgICAgIAkJCQkJYXRzcnUtPmRldmljZXNfY250KTsKPj4+PiBAQCAtNDc3OSw2ICs0
Nzk3LDI2IEBAIHN0YXRpYyBpbnQgX19pbml0Cj4+Pj4gcGxhdGZvcm1fb3B0aW5fZm9yY2VfaW9t
bXUodm9pZCkKPj4+PiAgICAgIAo+Pj4+ICAgICAgCXJldHVybiAxOwo+Pj4+ICAgICAgfQo+Pj4+
ICtzdGF0aWMgaW50IGFjcGlfZGV2aWNlX2NyZWF0ZV9kaXJlY3RfbWFwcGluZ3Moc3RydWN0IGRl
dmljZQo+Pj4+ICsqcG5fZGV2LCBzdHJ1Y3QgZGV2aWNlICphY3BpX2RldmljZSkgewo+Pj4+ICsJ
aW50IHJldDsKPj4+PiArCXN0cnVjdCBpb21tdV9ncm91cCAqZ3JvdXA7Cj4+Pj4gKwo+Pj4+ICsJ
aWYgKHBuX2RldiA9PSBOVUxMKSB7Cj4+Pj4gKwkJYWNwaV9kZXZpY2UtPmJ1cy0+aW9tbXVfb3Bz
ID0gJmludGVsX2lvbW11X29wczsKPj4+PiArCQlyZXQgPSBpb21tdV9wcm9iZV9kZXZpY2UoYWNw
aV9kZXZpY2UpOwo+Pj4+ICsJCWlmIChyZXQpIHsKPj4+PiArCQkJcHJfZXJyKCJhY3BpX2Rldmlj
ZSBwcm9iZSBmYWlsISByZXQ6JWRcbiIsIHJldCk7Cj4+Pj4gKwkJCXJldHVybiByZXQ7Cj4+Pj4g
KwkJfQo+Pj4+ICsJCXJldHVybiAwOwo+Pj4+ICsJfQo+Pj4+ICsJYWNwaV9kZXZpY2UtPmJ1cy0+
aW9tbXVfb3BzID0gJmludGVsX2lvbW11X29wczsKPj4+PiArCWdyb3VwID0gaW9tbXVfZ3JvdXBf
Z2V0KHBuX2Rldik7Cj4+Pj4gKwlfX2FjcGlfZGV2aWNlX2NyZWF0ZV9kaXJlY3RfbWFwcGluZ3Mo
Z3JvdXAsIGFjcGlfZGV2aWNlKTsKPj4+PiArCj4+Pj4gKwlyZXR1cm4gMDsKPj4+PiArfQo+Pj4+
ICAgICAgCj4+Pj4gICAgICBzdGF0aWMgaW50IF9faW5pdCBwcm9iZV9hY3BpX25hbWVzcGFjZV9k
ZXZpY2VzKHZvaWQpCj4+Pj4gICAgICB7Cj4+Pj4gQEAgLTQ3OTQsNiArNDgzMiw3IEBAIHN0YXRp
YyBpbnQgX19pbml0IHByb2JlX2FjcGlfbmFtZXNwYWNlX2RldmljZXModm9pZCkKPj4+PiAgICAg
IAkJCXN0cnVjdCBhY3BpX2RldmljZV9waHlzaWNhbF9ub2RlICpwbjsKPj4+PiAgICAgIAkJCXN0
cnVjdCBpb21tdV9ncm91cCAqZ3JvdXA7Cj4+Pj4gICAgICAJCQlzdHJ1Y3QgYWNwaV9kZXZpY2Ug
KmFkZXY7Cj4+Pj4gKwkJCXN0cnVjdCBkZXZpY2UgKnBuX2RldiA9IE5VTEw7Cj4+Pj4gICAgICAK
Pj4+PiAgICAgIAkJCWlmIChkZXYtPmJ1cyAhPSAmYWNwaV9idXNfdHlwZSkKPj4+PiAgICAgIAkJ
CQljb250aW51ZTsKPj4+PiBAQCAtNDgwNCw2ICs0ODQzLDcgQEAgc3RhdGljIGludCBfX2luaXQg
cHJvYmVfYWNwaV9uYW1lc3BhY2VfZGV2aWNlcyh2b2lkKQo+Pj4+ICAgICAgCQkJCQkgICAgJmFk
ZXYtPnBoeXNpY2FsX25vZGVfbGlzdCwgbm9kZSkgewo+Pj4+ICAgICAgCQkJCWdyb3VwID0gaW9t
bXVfZ3JvdXBfZ2V0KHBuLT5kZXYpOwo+Pj4+ICAgICAgCQkJCWlmIChncm91cCkgewo+Pj4+ICsJ
CQkJCXBuX2RldiA9IHBuLT5kZXY7Cj4+Pj4gICAgICAJCQkJCWlvbW11X2dyb3VwX3B1dChncm91
cCk7Cj4+Pj4gICAgICAJCQkJCWNvbnRpbnVlOwo+Pj4+ICAgICAgCQkJCX0KPj4+PiBAQCAtNDgx
Miw3ICs0ODUyLDkgQEAgc3RhdGljIGludCBfX2luaXQgcHJvYmVfYWNwaV9uYW1lc3BhY2VfZGV2
aWNlcyh2b2lkKQo+Pj4+ICAgICAgCQkJCXJldCA9IGlvbW11X3Byb2JlX2RldmljZShwbi0+ZGV2
KTsKPj4+PiAgICAgIAkJCQlpZiAocmV0KQo+Pj4+ICAgICAgCQkJCQlicmVhazsKPj4+PiArCQkJ
CXBuX2RldiA9IHBuLT5kZXY7Cj4+Pj4gICAgICAJCQl9Cj4+Pj4gKwkJCXJldCA9IGFjcGlfZGV2
aWNlX2NyZWF0ZV9kaXJlY3RfbWFwcGluZ3MocG5fZGV2LCBkZXYpOwo+Pj4+ICAgICAgCQkJbXV0
ZXhfdW5sb2NrKCZhZGV2LT5waHlzaWNhbF9ub2RlX2xvY2spOwo+Pj4+ICAgICAgCj4+Pj4gICAg
ICAJCQlpZiAocmV0KQo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lvbW11L2lvbW11LmMgYi9k
cml2ZXJzL2lvbW11L2lvbW11LmMgaW5kZXgKPj4+PiA2MDliZDI1YmYxNTQuLjRmNzE0YTJkNWVm
NyAxMDA2NDQKPj4+PiAtLS0gYS9kcml2ZXJzL2lvbW11L2lvbW11LmMKPj4+PiArKysgYi9kcml2
ZXJzL2lvbW11L2lvbW11LmMKPj4+PiBAQCAtNzc5LDYgKzc3OSwxMiBAQCBzdGF0aWMgYm9vbCBp
b21tdV9pc19hdHRhY2hfZGVmZXJyZWQoc3RydWN0IGlvbW11X2RvbWFpbiAqZG9tYWluLAo+Pj4+
ICAgICAgCXJldHVybiBmYWxzZTsKPj4+PiAgICAgIH0KPj4+PiAgICAgIAo+Pj4+ICt2b2lkICBf
X2FjcGlfZGV2aWNlX2NyZWF0ZV9kaXJlY3RfbWFwcGluZ3Moc3RydWN0IGlvbW11X2dyb3VwCj4+
Pj4gKypncm91cCwgc3RydWN0IGRldmljZSAqYWNwaV9kZXZpY2UpIHsKPj4+PiArCWlvbW11X2Ny
ZWF0ZV9kZXZpY2VfZGlyZWN0X21hcHBpbmdzKGdyb3VwLCBhY3BpX2RldmljZSk7IH0KPj4+PiAr
RVhQT1JUX1NZTUJPTF9HUEwoX19hY3BpX2RldmljZV9jcmVhdGVfZGlyZWN0X21hcHBpbmdzKTsK
Pj4+PiArCj4+Pj4gICAgICAvKioKPj4+PiAgICAgICAqIGlvbW11X2dyb3VwX2FkZF9kZXZpY2Ug
LSBhZGQgYSBkZXZpY2UgdG8gYW4gaW9tbXUgZ3JvdXAKPj4+PiAgICAgICAqIEBncm91cDogdGhl
IGdyb3VwIGludG8gd2hpY2ggdG8gYWRkIHRoZSBkZXZpY2UgKHJlZmVyZW5jZQo+Pj4+IHNob3Vs
ZCBiZSBoZWxkKSBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9kbWFyLmgKPj4+PiBiL2luY2x1
ZGUvbGludXgvZG1hci5oIGluZGV4IDY1NTY1ODIwMzI4YS4uODgxYWM2MWE0MzM2IDEwMDY0NAo+
Pj4+IC0tLSBhL2luY2x1ZGUvbGludXgvZG1hci5oCj4+Pj4gKysrIGIvaW5jbHVkZS9saW51eC9k
bWFyLmgKPj4+PiBAQCAtMTEzLDEwICsxMTMsMTQgQEAgZXh0ZXJuIGludCBkbWFyX3BhcnNlX2Rl
dl9zY29wZSh2b2lkICpzdGFydCwgdm9pZCAqZW5kLCBpbnQgKmNudCwKPj4+PiAgICAgIAkJCQlz
dHJ1Y3QgZG1hcl9kZXZfc2NvcGUgKipkZXZpY2VzLCB1MTYgc2VnbWVudCk7Cj4+Pj4gICAgICBl
eHRlcm4gdm9pZCAqZG1hcl9hbGxvY19kZXZfc2NvcGUodm9pZCAqc3RhcnQsIHZvaWQgKmVuZCwg
aW50ICpjbnQpOwo+Pj4+ICAgICAgZXh0ZXJuIHZvaWQgZG1hcl9mcmVlX2Rldl9zY29wZShzdHJ1
Y3QgZG1hcl9kZXZfc2NvcGUgKipkZXZpY2VzLAo+Pj4+IGludCAqY250KTsgLWV4dGVybiBpbnQg
ZG1hcl9pbnNlcnRfZGV2X3Njb3BlKHN0cnVjdAo+Pj4+IGRtYXJfcGNpX25vdGlmeV9pbmZvICpp
bmZvLAo+Pj4+ICtleHRlcm4gaW50IGRtYXJfcGNpX2luc2VydF9kZXZfc2NvcGUoc3RydWN0IGRt
YXJfcGNpX25vdGlmeV9pbmZvCj4+Pj4gKyppbmZvLAo+Pj4+ICAgICAgCQkJCSB2b2lkICpzdGFy
dCwgdm9pZCplbmQsIHUxNiBzZWdtZW50LAo+Pj4+ICAgICAgCQkJCSBzdHJ1Y3QgZG1hcl9kZXZf
c2NvcGUgKmRldmljZXMsCj4+Pj4gICAgICAJCQkJIGludCBkZXZpY2VzX2NudCk7Cj4+Pj4gK2V4
dGVybiBpbnQgZG1hcl9hY3BpX2luc2VydF9kZXZfc2NvcGUodTggZGV2aWNlX251bWJlciwKPj4+
PiArCQkJCXN0cnVjdCBhY3BpX2RldmljZSAqYWRldiwgdm9pZCAqc3RhcnQsIHZvaWQgKmVuZCwK
Pj4+PiArCQkJCXN0cnVjdCBkbWFyX2Rldl9zY29wZSAqZGV2aWNlcywgaW50IGRldmljZXNfY250
KTsKPj4+PiArCj4+Pj4gICAgICBleHRlcm4gaW50IGRtYXJfcmVtb3ZlX2Rldl9zY29wZShzdHJ1
Y3QgZG1hcl9wY2lfbm90aWZ5X2luZm8gKmluZm8sCj4+Pj4gICAgICAJCQkJIHUxNiBzZWdtZW50
LCBzdHJ1Y3QgZG1hcl9kZXZfc2NvcGUgKmRldmljZXMsCj4+Pj4gICAgICAJCQkJIGludCBjb3Vu
dCk7Cj4+Pj4gQEAgLTE0MCw2ICsxNDQsNyBAQCBleHRlcm4gaW50IGRtYXJfcGFyc2Vfb25lX2F0
c3Ioc3RydWN0IGFjcGlfZG1hcl9oZWFkZXIgKmhlYWRlciwgdm9pZCAqYXJnKTsKPj4+PiAgICAg
IGV4dGVybiBpbnQgZG1hcl9jaGVja19vbmVfYXRzcihzdHJ1Y3QgYWNwaV9kbWFyX2hlYWRlciAq
aGRyLCB2b2lkICphcmcpOwo+Pj4+ICAgICAgZXh0ZXJuIGludCBkbWFyX3JlbGVhc2Vfb25lX2F0
c3Ioc3RydWN0IGFjcGlfZG1hcl9oZWFkZXIgKmhkciwgdm9pZCAqYXJnKTsKPj4+PiAgICAgIGV4
dGVybiBpbnQgZG1hcl9pb21tdV9ob3RwbHVnKHN0cnVjdCBkbWFyX2RyaGRfdW5pdCAqZG1hcnUs
IGJvb2wKPj4+PiBpbnNlcnQpOwo+Pj4+ICtleHRlcm4gaW50IGRtYXJfcm1ycl9hZGRfYWNwaV9k
ZXYodTggZGV2aWNlX251bWJlciwgc3RydWN0Cj4+Pj4gK2FjcGlfZGV2aWNlICphZGV2KTsKPj4+
PiAgICAgIGV4dGVybiBpbnQgZG1hcl9pb21tdV9ub3RpZnlfc2NvcGVfZGV2KHN0cnVjdCBkbWFy
X3BjaV9ub3RpZnlfaW5mbyAqaW5mbyk7Cj4+Pj4gICAgICAjZWxzZSAvKiAhQ09ORklHX0lOVEVM
X0lPTU1VOiAqLwo+Pj4+ICAgICAgc3RhdGljIGlubGluZSBpbnQgaW50ZWxfaW9tbXVfaW5pdCh2
b2lkKSB7IHJldHVybiAtRU5PREVWOyB9IEBACj4+Pj4gLTE1MCw2ICsxNTUsMTEgQEAgc3RhdGlj
IGlubGluZSB2b2lkIGludGVsX2lvbW11X3NodXRkb3duKHZvaWQpIHsgfQo+Pj4+ICAgICAgI2Rl
ZmluZQlkbWFyX2NoZWNrX29uZV9hdHNyCQlkbWFyX3Jlc19ub29wCj4+Pj4gICAgICAjZGVmaW5l
CWRtYXJfcmVsZWFzZV9vbmVfYXRzcgkJZG1hcl9yZXNfbm9vcAo+Pj4+ICAgICAgCj4+Pj4gK3N0
YXRpYyBpbmxpbmUgaW50IGRtYXJfcm1ycl9hZGRfYWNwaV9kZXYodTggZGV2aWNlX251bWJlciwg
c3RydWN0Cj4+Pj4gK2FjcGlfZGV2aWNlICphZGV2KSB7Cj4+Pj4gKwlyZXR1cm4gMDsKPj4+PiAr
fQo+Pj4+ICsKPj4+PiAgICAgIHN0YXRpYyBpbmxpbmUgaW50IGRtYXJfaW9tbXVfbm90aWZ5X3Nj
b3BlX2RldihzdHJ1Y3QgZG1hcl9wY2lfbm90aWZ5X2luZm8gKmluZm8pCj4+Pj4gICAgICB7Cj4+
Pj4gICAgICAJcmV0dXJuIDA7Cj4+Pj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvaW9tbXUu
aCBiL2luY2x1ZGUvbGludXgvaW9tbXUuaCBpbmRleAo+Pj4+IGZlZTIwOWVmYjc1Ni4uOWJlMTM0
Nzc1ODg2IDEwMDY0NAo+Pj4+IC0tLSBhL2luY2x1ZGUvbGludXgvaW9tbXUuaAo+Pj4+ICsrKyBi
L2luY2x1ZGUvbGludXgvaW9tbXUuaAo+Pj4+IEBAIC01MTQsNiArNTE0LDkgQEAgZXh0ZXJuIHZv
aWQgaW9tbXVfZG9tYWluX3dpbmRvd19kaXNhYmxlKHN0cnVjdCBpb21tdV9kb21haW4gKmRvbWFp
biwgdTMyIHduZF9ucikKPj4+PiAgICAgIGV4dGVybiBpbnQgcmVwb3J0X2lvbW11X2ZhdWx0KHN0
cnVjdCBpb21tdV9kb21haW4gKmRvbWFpbiwgc3RydWN0IGRldmljZSAqZGV2LAo+Pj4+ICAgICAg
CQkJICAgICAgdW5zaWduZWQgbG9uZyBpb3ZhLCBpbnQgZmxhZ3MpOwo+Pj4+ICAgICAgCj4+Pj4g
K2V4dGVybiB2b2lkIF9fYWNwaV9kZXZpY2VfY3JlYXRlX2RpcmVjdF9tYXBwaW5ncyhzdHJ1Y3Qg
aW9tbXVfZ3JvdXAgKmdyb3VwLAo+Pj4+ICsJCQkJCQlzdHJ1Y3QgZGV2aWNlICphY3BpX2Rldmlj
ZSk7Cj4+Pj4gKwo+Pj4+ICAgICAgc3RhdGljIGlubGluZSB2b2lkIGlvbW11X2ZsdXNoX3RsYl9h
bGwoc3RydWN0IGlvbW11X2RvbWFpbiAqZG9tYWluKQo+Pj4+ICAgICAgewo+Pj4+ICAgICAgCWlm
IChkb21haW4tPm9wcy0+Zmx1c2hfaW90bGJfYWxsKQo+Pj4+Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmlvbW11IG1haWxpbmcgbGlzdAppb21tdUBsaXN0
cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcv
bWFpbG1hbi9saXN0aW5mby9pb21tdQ==
