Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A855665D2
	for <lists.iommu@lfdr.de>; Tue,  5 Jul 2022 11:06:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E555460EE4;
	Tue,  5 Jul 2022 09:06:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E555460EE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m0tf-leQibFL; Tue,  5 Jul 2022 09:06:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id B561360EEE;
	Tue,  5 Jul 2022 09:06:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B561360EEE
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 936B2C002D;
	Tue,  5 Jul 2022 09:06:37 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B5442C002D
 for <iommu@lists.linux-foundation.org>; Tue,  5 Jul 2022 09:06:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8F2D8408EA
 for <iommu@lists.linux-foundation.org>; Tue,  5 Jul 2022 09:06:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F2D8408EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ju4Fi_NmPqf2 for <iommu@lists.linux-foundation.org>;
 Tue,  5 Jul 2022 09:06:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96931408D5
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp4.osuosl.org (Postfix) with ESMTP id 96931408D5
 for <iommu@lists.linux-foundation.org>; Tue,  5 Jul 2022 09:06:33 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F1563152B;
 Tue,  5 Jul 2022 02:06:32 -0700 (PDT)
Received: from [10.57.86.91] (unknown [10.57.86.91])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AF36E3F792;
 Tue,  5 Jul 2022 02:06:30 -0700 (PDT)
Message-ID: <d36c80e3-2b04-b83b-3eb6-0f1d66d68fcf@arm.com>
Date: Tue, 5 Jul 2022 10:06:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 03/14] iommu: Move bus setup to IOMMU device
 registration
Content-Language: en-GB
To: Baolu Lu <baolu.lu@linux.intel.com>, joro@8bytes.org, will@kernel.org
References: <cover.1650890638.git.robin.murphy@arm.com>
 <1faba5b5c094379df3d99b8fec924ab50ad75482.1650890638.git.robin.murphy@arm.com>
 <0e459e6e-f236-7a58-970a-a47677a23b44@linux.intel.com>
 <fa0d0663-5393-c533-105a-85bd2e9e0649@arm.com>
 <1322706e-5905-433b-5bc5-ed44f881b510@arm.com>
 <fc0ddc34-e289-d225-f9ae-bf629e834a6b@linux.intel.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <fc0ddc34-e289-d225-f9ae-bf629e834a6b@linux.intel.com>
Cc: jean-philippe@linaro.org, zhang.lyra@gmail.com,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 thierry.reding@gmail.com, gerald.schaefer@linux.ibm.com,
 linux-arm-kernel@lists.infradead.org
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

T24gMjAyMi0wNy0wNSAwNTo1MSwgQmFvbHUgTHUgd3JvdGU6Cj4gSGkgUm9iaW4sCj4gCj4gT24g
MjAyMi80LzMwIDAyOjA2LCBSb2JpbiBNdXJwaHkgd3JvdGU6Cj4+IE9uIDI5LzA0LzIwMjIgOTo1
MCBhbSwgUm9iaW4gTXVycGh5IHdyb3RlOgo+Pj4gT24gMjAyMi0wNC0yOSAwNzo1NywgQmFvbHUg
THUgd3JvdGU6Cj4+Pj4gSGkgUm9iaW4sCj4+Pj4KPj4+PiBPbiAyMDIyLzQvMjggMjE6MTgsIFJv
YmluIE11cnBoeSB3cm90ZToKPj4+Pj4gTW92ZSB0aGUgYnVzIHNldHVwIHRvIGlvbW11X2Rldmlj
ZV9yZWdpc3RlcigpLiBUaGlzIHNob3VsZCBhbGxvdwo+Pj4+PiBidXNfaW9tbXVfcHJvYmUoKSB0
byBiZSBjb3JyZWN0bHkgcmVwbGF5ZWQgZm9yIG11bHRpcGxlIElPTU1VIAo+Pj4+PiBpbnN0YW5j
ZXMsCj4+Pj4+IGFuZCBsZWF2ZXMgYnVzX3NldF9pb21tdSgpIGFzIGEgZ2xvcmlmaWVkIG5vLW9w
IHRvIGJlIGNsZWFuZWQgdXAgbmV4dC4KPj4+Pgo+Pj4+IEkgcmUtZmV0Y2hlZCB0aGUgbGF0ZXN0
IHBhdGNoZXMgb24KPj4+Pgo+Pj4+IGh0dHBzOi8vZ2l0bGFiLmFybS5jb20vbGludXgtYXJtL2xp
bnV4LXJtLy0vY29tbWl0cy9pb21tdS9idXMKPj4+Pgo+Pj4+IGFuZCByb2xsZWQgYmFjayB0aGUg
aGVhZCB0byAiaW9tbXU6IENsZWFudXAgYnVzX3NldF9pb21tdSIuCj4+Pj4KPj4+PiBUaGUgdGVz
dCBtYWNoaW5lIHN0aWxsIGhhbmdzIGR1cmluZyBib290Lgo+Pj4+Cj4+Pj4gSSB3ZW50IHRocm91
Z2ggdGhlIGNvZGUuIEl0IHNlZW1zIHRoYXQgdGhlIC5wcm9iZV9kZXZpY2UgZm9yIEludGVsIAo+
Pj4+IElPTU1VCj4+Pj4gZHJpdmVyIGNhbid0IGhhbmRsZSB0aGUgcHJvYmUgcmVwbGF5IHdlbGwu
IEl0IGFsd2F5cyBhc3N1bWVzIHRoYXQgdGhlCj4+Pj4gZGV2aWNlIGhhcyBuZXZlciBiZWVuIHBy
b2JlZC4KPj4+Cj4+PiBIbW0sIGJ1dCBwcm9iZV9pb21tdV9ncm91cCgpIGlzIHN1cHBvc2VkIHRv
IHByZXZlbnQgdGhlIAo+Pj4gX19pb21tdV9wcm9iZV9kZXZpY2UoKSBjYWxsIGV2ZW4gaGFwcGVu
aW5nIGlmIHRoZSBkZXZpY2UgKmhhcyogCj4+PiBhbHJlYWR5IGJlZW4gcHJvYmVkIGJlZm9yZSA6
Lwo+Pj4KPj4+IEkndmUgc3RpbGwgZ290IGFuIG9sZCBJbnRlbCBib3ggc3BhcmUgaW4gdGhlIG9m
ZmljZSBzbyBJJ2xsIHJpZyB0aGF0IAo+Pj4gdXAgYW5kIHNlZSBpZiBJIGNhbiBzZWUgd2hhdCBt
aWdodCBiZSBnb2luZyBvbiBoZXJlLi4uCj4+Cj4+IE9LLCBvbiBhIFhlb24gd2l0aCB0d28gRE1B
UiB1bml0cywgdGhpcyBzZWVtcyB0byBib290IE9LIHdpdGggb3IgCj4+IHdpdGhvdXQgcGF0Y2gg
IzEsIHNvIGl0IGRvZXNuJ3Qgc2VlbSB0byBiZSBhIGdlbmVyYWwgcHJvYmxlbSB3aXRoIAo+PiBy
ZXBsYXlpbmcgaW4gaW9tbXVfZGV2aWNlX3JlZ2lzdGVyKCksIG9yIHdpdGggcGxhdGZvcm0gZGV2
aWNlcy4gTm90IAo+PiBzdXJlIHdoZXJlIHRvIGdvIGZyb20gaGVyZS4uLiA6Lwo+IAo+IFRoZSBr
ZXJuZWwgYm9vdCBwYW5pYyBtZXNzYWdlOgo+IAo+IFvCoMKgwqAgNi42Mzk0MzJdIEJVRzoga2Vy
bmVsIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZSwgYWRkcmVzczogCj4gMDAwMDAwMDAwMDAwMDAy
OAo+IFvCoMKgwqAgNi43NDM4MjldICNQRjogc3VwZXJ2aXNvciByZWFkIGFjY2VzcyBpbiBrZXJu
ZWwgbW9kZQo+IFvCoMKgwqAgNi43NDM4MjldICNQRjogZXJyb3JfY29kZSgweDAwMDApIC0gbm90
LXByZXNlbnQgcGFnZQo+IFvCoMKgwqAgNi43NDM4MjldIFBHRCAwCj4gW8KgwqDCoCA2Ljc0Mzgy
OV0gT29wczogMDAwMCBbIzFdIFBSRUVNUFQgU01QIE5PUFRJCj4gW8KgwqDCoCA2Ljc0MzgyOV0g
Q1BVOiAwIFBJRDogMSBDb21tOiBzd2FwcGVyLzAgVGFpbnRlZDogR8KgwqDCoMKgwqDCoMKgwqDC
oCBJIAo+ICDCoDUuMTkuMC1yYzMrICMxODIKPiBbwqDCoMKgIDYuNzQzODI5XSBSSVA6IDAwMTA6
X19pb21tdV9wcm9iZV9kZXZpY2UrMHgxMTUvMHgyMDAKPiBbwqDCoMKgIDYuNzQzODI5XSBDb2Rl
OiA4OSBmZiBlOCAzZSBlMSBmZiBmZiA0OCA4NSBjMCAwZiA4NSA0NyBmZiBmZiBmZiA0MSAKPiBi
ZCBmNCBmZiBmZiBmZiBlYiA4MyA0OCA4YiA4MyBkOCAwMiAwMCAwMCA0OCA4OSBkZiA0OCA4YiA0
MCAzOCA0OCA4YiA0MCAKPiAxMCA8NDg+IDhiIDQwIDI4IGZmIGQwIDBmIDFmIDAwIDQ4IDg5IGMx
IDQ4IDg1IGMwIDBmIDg0IGI3IDAwIDAwIDAwIDQ4Cj4gW8KgwqDCoCA2Ljc0MzgyOV0gUlNQOiAw
MDAwOmZmMzA2MDVjMDAwNjNkNDAgRUZMQUdTOiAwMDAxMDI0Ngo+IFvCoMKgwqAgNi43NDM4Mjld
IFJBWDogMDAwMDAwMDAwMDAwMDAwMCBSQlg6IGZmMTI4YjljNWZkYzkwZDAgUkNYOiAKPiAwMDAw
MDAwMDAwMDAwMDAwCj4gW8KgwqDCoCA2Ljc0MzgyOV0gUkRYOiAwMDAwMDAwMDgwMDAwMDAxIFJT
STogMDAwMDAwMDAwMDAwMDI0NiBSREk6IAo+IGZmMTI4YjljNWZkYzkwZDAKPiBbwqDCoMKgIDYu
NzQzODI5XSBSQlA6IGZmZmZmZmZmYjYwYzM0ZTAgUjA4OiBmZmZmZmZmZmI2ODY2NGQwIFIwOTog
Cj4gZmYxMjhiOTUwMWQ0Y2U0MAo+IFvCoMKgwqAgNi43NDM4MjldIFIxMDogZmZmZmZmZmZiNjI2
NzA5NiBSMTE6IGZmMTI4Yjk1MDAxNGMyNjcgUjEyOiAKPiBmZjMwNjA1YzAwMDYzZGUwCj4gW8Kg
wqDCoCA2Ljc0MzgyOV0gUjEzOiAwMDAwMDAwMDAwMWI5ZDI4IFIxNDogZmYxMjhiOTUwMDFiOWQy
OCBSMTU6IAo+IGZmMTI4YjljNWZkYzkzYTgKPiBbwqDCoMKgIDYuNzQzODI5XSBGUzrCoCAwMDAw
MDAwMDAwMDAwMDAwKDAwMDApIEdTOmZmMTI4YjljNWZjMDAwMDAoMDAwMCkgCj4ga25sR1M6MDAw
MDAwMDAwMDAwMDAwMAo+IFvCoMKgwqAgNi43NDM4MjldIENTOsKgIDAwMTAgRFM6IDAwMDAgRVM6
IDAwMDAgQ1IwOiAwMDAwMDAwMDgwMDUwMDMzCj4gW8KgwqDCoCA2Ljc0MzgyOV0gQ1IyOiAwMDAw
MDAwMDAwMDAwMDI4IENSMzogMDAwMDAwMDE0OTIxMDAwMSBDUjQ6IAo+IDAwMDAwMDAwMDA3NzFl
ZjAKPiBbwqDCoMKgIDYuNzQzODI5XSBEUjA6IDAwMDAwMDAwMDAwMDAwMDAgRFIxOiAwMDAwMDAw
MDAwMDAwMDAwIERSMjogCj4gMDAwMDAwMDAwMDAwMDAwMAo+IFvCoMKgwqAgNi43NDM4MjldIERS
MzogMDAwMDAwMDAwMDAwMDAwMCBEUjY6IDAwMDAwMDAwZmZmZjA3ZjAgRFI3OiAKPiAwMDAwMDAw
MDAwMDAwNDAwCj4gW8KgwqDCoCA2Ljc0MzgyOV0gUEtSVTogNTU1NTU1NTQKPiBbwqDCoMKgIDYu
NzQzODI5XSBDYWxsIFRyYWNlOgo+IFvCoMKgwqAgNi43NDM4MjldwqAgPFRBU0s+Cj4gW8KgwqDC
oCA2Ljc0MzgyOV3CoCA/IF9yYXdfc3Bpbl9sb2NrX2lycXNhdmUrMHgxNy8weDQwCj4gW8KgwqDC
oCA2Ljc0MzgyOV3CoCA/IF9faW9tbXVfcHJvYmVfZGV2aWNlKzB4MjAwLzB4MjAwCj4gW8KgwqDC
oCA2Ljc0MzgyOV3CoCBwcm9iZV9pb21tdV9ncm91cCsweDJkLzB4NDAKPiBbwqDCoMKgIDYuNzQz
ODI5XcKgIGJ1c19mb3JfZWFjaF9kZXYrMHg3NC8weGMwCj4gW8KgwqDCoCA2Ljc0MzgyOV3CoCBi
dXNfaW9tbXVfcHJvYmUrMHg0OC8weDJkMAo+IFvCoMKgwqAgNi43NDM4MjldwqAgaW9tbXVfZGV2
aWNlX3JlZ2lzdGVyKzB4ZGUvMHgxMjAKPiBbwqDCoMKgIDYuNzQzODI5XcKgIGludGVsX2lvbW11
X2luaXQrMHgzNWYvMHg1ZjIKPiBbwqDCoMKgIDYuNzQzODI5XcKgID8gaW9tbXVfc2V0dXArMHgy
N2QvMHgyN2QKPiBbwqDCoMKgIDYuNzQzODI5XcKgID8gcmRpbml0X3NldHVwKzB4MmMvMHgyYwo+
IFvCoMKgwqAgNi43NDM4MjldwqAgcGNpX2lvbW11X2luaXQrMHhlLzB4MzIKPiBbwqDCoMKgIDYu
NzQzODI5XcKgIGRvX29uZV9pbml0Y2FsbCsweDQxLzB4MjAwCj4gW8KgwqDCoCA2Ljc0MzgyOV3C
oCBrZXJuZWxfaW5pdF9mcmVlYWJsZSsweDFkZS8weDIyOAo+IFvCoMKgwqAgNi43NDM4MjldwqAg
PyByZXN0X2luaXQrMHhjMC8weGMwCj4gW8KgwqDCoCA2Ljc0MzgyOV3CoCBrZXJuZWxfaW5pdCsw
eDE2LzB4MTIwCj4gW8KgwqDCoCA2Ljc0MzgyOV3CoCByZXRfZnJvbV9mb3JrKzB4MWYvMHgzMAo+
IFvCoMKgwqAgNi43NDM4MjldwqAgPC9UQVNLPgo+IFvCoMKgwqAgNi43NDM4MjldIE1vZHVsZXMg
bGlua2VkIGluOgo+IFvCoMKgwqAgNi43NDM4MjldIENSMjogMDAwMDAwMDAwMDAwMDAyOAo+IFvC
oMKgwqAgNi43NDM4MjldIC0tLVsgZW5kIHRyYWNlIDAwMDAwMDAwMDAwMDAwMDAgXS0tLQo+IFvC
oMKgwqAgNi43NDM4MjldIFJJUDogMDAxMDpfX2lvbW11X3Byb2JlX2RldmljZSsweDExNS8weDIw
MAo+IFvCoMKgwqAgNi43NDM4MjldIENvZGU6IDg5IGZmIGU4IDNlIGUxIGZmIGZmIDQ4IDg1IGMw
IDBmIDg1IDQ3IGZmIGZmIGZmIDQxIAo+IGJkIGY0IGZmIGZmIGZmIGViIDgzIDQ4IDhiIDgzIGQ4
IDAyIDAwIDAwIDQ4IDg5IGRmIDQ4IDhiIDQwIDM4IDQ4IDhiIDQwIAo+IDEwIDw0OD4gOGIgNDAg
MjggZmYgZDAgMGYgMWYgMDAgNDggODkgYzEgNDggODUgYzAgMGYgODQgYjcgMDAgMDAgMDAgNDgK
PiBbwqDCoMKgIDYuNzQzODI5XSBSU1A6IDAwMDA6ZmYzMDYwNWMwMDA2M2Q0MCBFRkxBR1M6IDAw
MDEwMjQ2Cj4gW8KgwqDCoCA2Ljc0MzgyOV0gUkFYOiAwMDAwMDAwMDAwMDAwMDAwIFJCWDogZmYx
MjhiOWM1ZmRjOTBkMCBSQ1g6IAo+IDAwMDAwMDAwMDAwMDAwMDAKPiBbwqDCoMKgIDYuNzQzODI5
XSBSRFg6IDAwMDAwMDAwODAwMDAwMDEgUlNJOiAwMDAwMDAwMDAwMDAwMjQ2IFJESTogCj4gZmYx
MjhiOWM1ZmRjOTBkMAo+IFvCoMKgwqAgNi43NDM4MjldIFJCUDogZmZmZmZmZmZiNjBjMzRlMCBS
MDg6IGZmZmZmZmZmYjY4NjY0ZDAgUjA5OiAKPiBmZjEyOGI5NTAxZDRjZTQwCj4gW8KgwqDCoCA2
Ljc0MzgyOV0gUjEwOiBmZmZmZmZmZmI2MjY3MDk2IFIxMTogZmYxMjhiOTUwMDE0YzI2NyBSMTI6
IAo+IGZmMzA2MDVjMDAwNjNkZTAKPiBbwqDCoMKgIDYuNzQzODI5XSBSMTM6IDAwMDAwMDAwMDAx
YjlkMjggUjE0OiBmZjEyOGI5NTAwMWI5ZDI4IFIxNTogCj4gZmYxMjhiOWM1ZmRjOTNhOAo+IFvC
oMKgwqAgNi43NDM4MjldIEZTOsKgIDAwMDAwMDAwMDAwMDAwMDAoMDAwMCkgR1M6ZmYxMjhiOWM1
ZmMwMDAwMCgwMDAwKSAKPiBrbmxHUzowMDAwMDAwMDAwMDAwMDAwCj4gW8KgwqDCoCA2Ljc0Mzgy
OV0gQ1M6wqAgMDAxMCBEUzogMDAwMCBFUzogMDAwMCBDUjA6IDAwMDAwMDAwODAwNTAwMzMKPiBb
wqDCoMKgIDYuNzQzODI5XSBDUjI6IDAwMDAwMDAwMDAwMDAwMjggQ1IzOiAwMDAwMDAwMTQ5MjEw
MDAxIENSNDogCj4gMDAwMDAwMDAwMDc3MWVmMAo+IFvCoMKgwqAgNi43NDM4MjldIERSMDogMDAw
MDAwMDAwMDAwMDAwMCBEUjE6IDAwMDAwMDAwMDAwMDAwMDAgRFIyOiAKPiAwMDAwMDAwMDAwMDAw
MDAwCj4gW8KgwqDCoCA2Ljc0MzgyOV0gRFIzOiAwMDAwMDAwMDAwMDAwMDAwIERSNjogMDAwMDAw
MDBmZmZmMDdmMCBEUjc6IAo+IDAwMDAwMDAwMDAwMDA0MDAKPiBbwqDCoMKgIDYuNzQzODI5XSBQ
S1JVOiA1NTU1NTU1NAo+IFvCoMKgwqAgNi43NDM4MjldIEtlcm5lbCBwYW5pYyAtIG5vdCBzeW5j
aW5nOiBGYXRhbCBleGNlcHRpb24KPiBbwqDCoMKgIDYuNzQzODI5XSAtLS1bIGVuZCBLZXJuZWwg
cGFuaWMgLSBub3Qgc3luY2luZzogRmF0YWwgZXhjZXB0aW9uIF0tLS0KPiAKPiBUaGUgIk5VTEwg
cG9pbnRlciBkZXJlZmVyZW5jZSIgaGFwcGVucyBhdCBsaW5lIDE2MjAgb2YgYmVsb3cgY29kZS4K
PiAKPiAxNjEwIHN0YXRpYyBzdHJ1Y3QgaW9tbXVfZ3JvdXAgKmlvbW11X2dyb3VwX2dldF9mb3Jf
ZGV2KHN0cnVjdCBkZXZpY2UgKmRldikKPiAxNjExIHsKPiAxNjEywqDCoMKgwqDCoMKgwqDCoCBj
b25zdCBzdHJ1Y3QgaW9tbXVfb3BzICpvcHMgPSBkZXZfaW9tbXVfb3BzKGRldik7Cj4gMTYxM8Kg
wqDCoMKgwqDCoMKgwqAgc3RydWN0IGlvbW11X2dyb3VwICpncm91cDsKPiAxNjE0wqDCoMKgwqDC
oMKgwqDCoCBpbnQgcmV0Owo+IDE2MTUKPiAxNjE2wqDCoMKgwqDCoMKgwqDCoCBncm91cCA9IGlv
bW11X2dyb3VwX2dldChkZXYpOwo+IDE2MTfCoMKgwqDCoMKgwqDCoMKgIGlmIChncm91cCkKPiAx
NjE4wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGdyb3VwOwo+IDE2MTkK
PiAxNjIwwqDCoMKgwqDCoMKgwqDCoCBncm91cCA9IG9wcy0+ZGV2aWNlX2dyb3VwKGRldik7Cj4g
MTYyMcKgwqDCoMKgwqDCoMKgwqAgaWYgKFdBUk5fT05fT05DRShncm91cCA9PSBOVUxMKSkKPiAx
NjIywqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIEVSUl9QVFIoLUVJTlZB
TCk7Cj4gMTYyMwo+IDE2MjTCoMKgwqDCoMKgwqDCoMKgIGlmIChJU19FUlIoZ3JvdXApKQo+IDE2
MjXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gZ3JvdXA7Cj4gCj4gVGhp
cyBwbGF0Zm9ybSBoYXMgbXVsdGlwbGUgSU9NTVUgdW5pdHMsIGVhY2ggc2VydmluZyBkaWZmZXJl
bnQgUENJCj4gZGV2aWNlcy4gVGhlIG9wcyBmaWVsZCBvZiBlYWNoIGlvbW11X2RldmljZSBpcyBp
bml0aWFsaXplZCBpbgo+IGlvbW11X2RldmljZV9yZWdpc3RlcigpLCBoZW5jZSB3aGVuIHRoZSBm
aXJzdCBJT01NVSBkZXZpY2UgZ2V0cwo+IHJlZ2lzdGVyZWQsIG9wcyBmaWVsZHMgb2Ygb3RoZXIg
aW9tbXVfZGV2aWNlcyBhcmUgTlVMTC4KPiAKPiBVbmZvcnR1bmF0ZWx5IGJ1c19pb21tdV9wcm9i
ZSgpIGNhbGxlZCBpbiBpb21tdV9kZXZpY2VfcmVnaXN0ZXIoKSBwcm9iZXMKPiAqYWxsKiBQQ0kg
ZGV2aWNlcy4gVGhpcyBwcm9iYWJseSBsZWFkcyB0byBhYm92ZSBOVUxMIHBvaW50ZXIgZGVyZWZl
cmVuY2UKPiBpc3N1ZS4KPiAKPiBQbGVhc2UgY29ycmVjdCBtZSBpZiBJIG92ZXJsb29rZWQgYW55
dGhpbmcuCgpIYSwgYXMgaXQgaGFwcGVucyBJIGFsc28ganVzdCBmaWd1cmVkIHRoaXMgb3V0IHll
c3RlcmRheSAoYWZ0ZXIgCnJlbWVtYmVyaW5nIHRoZSBpbXBvcnRhbnQgZGV0YWlsIG9mICJpbnRl
bF9pb21tdT1vbiIsIHRyeWluZyB0aGUgbG9ja2RlcCAKdGVzdCksIHNvIGl0J3MgZ29vZCB0byBo
YXZlIGNvbmZpcm1hdGlvbiwgdGhhbmtzISBJJ2xsIHRlc3QgYSBmaXggdG9kYXkgCmFuZCBzZW5k
IHYzIHNvb24uCgpDaGVlcnMsClJvYmluLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwppb21tdSBtYWlsaW5nIGxpc3QKaW9tbXVAbGlzdHMubGludXgtZm91
bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlz
dGluZm8vaW9tbXU=
