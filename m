Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0443EB340
	for <lists.iommu@lfdr.de>; Fri, 13 Aug 2021 11:16:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16A844041A;
	Fri, 13 Aug 2021 09:16:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1q-5OKqJ9t2R; Fri, 13 Aug 2021 09:16:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 4946D4053B;
	Fri, 13 Aug 2021 09:16:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B68C0C001B;
	Fri, 13 Aug 2021 09:16:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B7329C000E
 for <iommu@lists.linux-foundation.org>; Fri, 13 Aug 2021 09:16:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AC6B14047B
 for <iommu@lists.linux-foundation.org>; Fri, 13 Aug 2021 09:16:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ViPDfCXRHBDZ for <iommu@lists.linux-foundation.org>;
 Fri, 13 Aug 2021 09:16:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF8984041A
 for <iommu@lists.linux-foundation.org>; Fri, 13 Aug 2021 09:16:08 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B66141042;
 Fri, 13 Aug 2021 02:16:07 -0700 (PDT)
Received: from [10.57.36.146] (unknown [10.57.36.146])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0071B3F70D;
 Fri, 13 Aug 2021 02:16:05 -0700 (PDT)
Subject: =?UTF-8?B?UmU6IOWbnuWkjTogW0V4dGVybmFsXVJlOiBBbiBjbWEgb3B0aW1pemF0?=
 =?UTF-8?Q?ion_patch_is_used_for_cma=5f=5balloc=7cfree=5d=2e?=
To: Jichao Zou <zoujc@motorola.com>, David Hildenbrand <david@redhat.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "minchan@kernel.org" <minchan@kernel.org>,
 "song.bao.hua@hisilicon.com" <song.bao.hua@hisilicon.com>,
 "hch@lst.de" <hch@lst.de>,
 "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 JianQi Yang <yangj@motorola.com>, Yanjune Tian <tianyje@motorola.com>
References: <HK0PR03MB4177A44D9DAD3302251B0EC8D5FA9@HK0PR03MB4177.apcprd03.prod.outlook.com>
 <f5cd9fe6-3b62-eab8-1ff1-d3943d4bb85b@redhat.com>
 <HK0PR03MB41775573A48273BF128C7F72D5FA9@HK0PR03MB4177.apcprd03.prod.outlook.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <ca497139-a6e8-cb66-e221-7fe4af2bda14@arm.com>
Date: Fri, 13 Aug 2021 10:15:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <HK0PR03MB41775573A48273BF128C7F72D5FA9@HK0PR03MB4177.apcprd03.prod.outlook.com>
Content-Language: en-GB
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

T24gMjAyMS0wOC0xMyAwOToyNywgSmljaGFvIFpvdSB3cm90ZToKPiBIaSBEYXZpZCwKPiAJSSds
bCBnaXQtc2VuZC1lbWFpbCBwYXRjaCBhZ2Fpbi4KPiAJWW91ciB1bmRlcnN0YW5kaW5nIGlzIGV4
YWN0bHkgcmlnaHQuCj4gCUxldCBtZSBleHBsYWluIHRoZSBiYWNrZ3JvdW5kIG9mIFBhdGNoLCB3
ZSBhcmUgZGV2ZWxvcGluZyBBbmRyb2lkIHBob25lLCBrZXJuZWwgaXMgNS4xMC40MyBMVFMsIHdl
IGVuY291bnRlciBjbWFfYWxsb2MgZmFpbGVkIGR1cmluZyBrZXJuZWwgc3RhcnR1cCwgYnVkZHkg
c3lzdGVtIGlzIHJlYWR5LAo+IDAxLTExIDE0OjIyOjA4LjY1MCAgIDIxNiAgIDIxNiBFIGNtYSAg
ICAgOiBjbWFfYWxsb2MoWzIxNl1baW5pdF06Y21hKGZmZmZmZmZmMDBiNTAwMDA6dG90YWwgODE5
MikgbGludXgsY21hKGZmZmZmZmU4OWQwODRjZjApLCBjb3VudCAyLCBhbGlnbiAxIGdmcF9tYXNr
IDB4Y2MwKQo+IDAxLTExIDE0OjIyOjA4LjY1MCAgIDIxNiAgIDIxNiBFIGNtYSAgICAgOiBjbWFf
YWxsb2MoKTogbWVtb3J5IHJhbmdlIGF0IGZmZmZmZmZmMDBiNjI4ODAgaXMgYnVzeSwgcmV0cnlp
bmcKPiAgIAo+IAljbWEgYml0bWFwIHNob3cgbWVtb3J5IGlzIGZyZWUsIGJ1dCBhbGxvY19jb250
aWdfcmFuZ2UgZmFpbGVkLCB3ZSBjaGVja2VkIGl0IG91dCB0aGF0IHNvbWUgZHJpdmVycyBjbWFf
YWxsb2MgYXJlCj4gCSJzdHJ1Y3QgcGFnZSAqY21hX2FsbG9jKHN0cnVjdCBjbWEgKmNtYSwgc2l6
ZV90IGNvdW50LCB1bnNpZ25lZCBpbnQgYWxpZ24sIGJvb2wgbm9fd2FybikiCj4gCUluIDUuMTAu
NDMsIGNtYV9hbGxvYyBpcwo+IAkic3RydWN0IHBhZ2UgKmNtYV9hbGxvYyhzdHJ1Y3QgY21hICpj
bWEsIHNpemVfdCBjb3VudCwgdW5zaWduZWQgaW50IGFsaWduLCBnZnBfdCBnZnBfbWFzaykiCj4g
ICAJQWZ0ZXIgY2hhbmdlIGNtYV9hbGxvYyBwYXJhbWV0ZXIgd2l0aCBHRlBfS0VSTkVMLCBpc3N1
ZSBpcyBmaXhlZCwgYXQgdGhlIHNhbWUgdGltZSwgd2UgZm91bmQgdGhhdCBwcmVhbGxvY2F0ZSBh
IHBvcnRpb24gb2YgY21hIG1lbW9yeSBmb3IgYXVkaW8mdmlkZW8gcmVzdWx0ZWQgaW4gYmV0dGVy
IHBlcmZvcm1hbmNlIGFuZCBndWFyYW50ZWUgQVYgZnVuY3Rpb24gZXZlbiB1bmRlciBtZW1vcnkg
cHJlc3N1cmUsIHNvIHdlIHRyeSB0byBzdWJtaXQgdGhpcyBwYXRjaC4KClRoZSB3aG9sZSBwb2lu
dCBvZiBDTUEgaXMgdGhhdCB0aGUgbWVtb3J5IGNhbiBiZSBzaGFyZWQgYnkgbW92ZWFibGUgCnBh
Z2VzIHdoaWxlIGl0J3Mgbm90IGJlaW5nIHVzZWQgZm9yIERNQS4gSWYgeW91IHdhbnQgYSBkZWRp
Y2F0ZWQgRE1BIApjYXJ2ZW91dCwgdGhlcmUgYXJlIGFscmVhZHkgbWVjaGFuaXNtcyBmb3IgdGhh
dC4KClJvYmluLgoKPiAKPiBUaGFua3MuCj4gCj4gQmVzdCBSZWdhcmRzLAo+IAo+IFpvdSBKaWNo
YW8g6YK557qq6LaFCj4gQWR2aXNvcnkgRW5naW5lZXIsIFNXIEJTUAo+IE1CRyBST1cgU1cgQkog
UEYgQlNQIChDTikKPiBNb3Rvcm9sYSBNb2JpbGl0eSwgQSBMZW5vdm8gQ29tcGFueQo+IG1vdG9y
b2xhLmNvbQo+IE0gKzg2IDE4OTEwODYwMjEyCj4gRSB6b3VqY0BsZW5vdm8uY29tCj4gdHdpdHRl
ciB8IGZhY2Vib29rIHwgaW5zdGFncmFtIHwgYmxvZyB8IGZvcnVtcwo+IAo+IAo+IAo+IAo+IC0t
LS0t6YKu5Lu25Y6f5Lu2LS0tLS0KPiDlj5Hku7bkuro6IERhdmlkIEhpbGRlbmJyYW5kIDxkYXZp
ZEByZWRoYXQuY29tPgo+IOWPkemAgeaXtumXtDogMjAyMeW5tDjmnIgxM+aXpSAxNTo0NQo+IOaU
tuS7tuS6ujogSmljaGFvIFpvdSA8em91amNAbW90b3JvbGEuY29tPjsgYWtwbUBsaW51eC1mb3Vu
ZGF0aW9uLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgbGludXgtbW1Aa3ZhY2su
b3JnOyBtaW5jaGFuQGtlcm5lbC5vcmc7IHNvbmcuYmFvLmh1YUBoaXNpbGljb24uY29tOyBoY2hA
bHN0LmRlOyBtLnN6eXByb3dza2lAc2Ftc3VuZy5jb207IHJvYmluLm11cnBoeUBhcm0uY29tOyBp
b21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZzsgSmlhblFpIFlhbmcgPHlhbmdqQG1vdG9y
b2xhLmNvbT47IFlhbmp1bmUgVGlhbiA8dGlhbnlqZUBtb3Rvcm9sYS5jb20+Cj4g5Li76aKYOiBb
RXh0ZXJuYWxdUmU6IEFuIGNtYSBvcHRpbWl6YXRpb24gcGF0Y2ggaXMgdXNlZCBmb3IgY21hX1th
bGxvY3xmcmVlXS4KPiAKPiBPbiAxMy4wOC4yMSAwOTowMCwgSmljaGFvIFpvdSB3cm90ZToKPj4g
UHJlLWFsbG9jYXRlwqBDTUHCoG1lbW9yecKgdGhhdMKgY29uZmlndXJlZMKgaW7CoGRldmljZSB0
cmVlLMKgdGhpc8KgZ3JlYXRseQo+PiBpbXByb3Zlc8KgdGhlwqBDTUHCoG1lbW9yeSBhbGxvY2F0
aW9uwqBlZmZpY2llbmN5LMKgY21hX1thbGxvY3xmcmVlXcKgaXMKPj4gbGVzcyB0aGFuwqAxbXMs
wqBvbGTCoHdhecKgaXPCoHRvb2vCoGHCoGZld8KgbXPCoHRvwqB0ZW5zwqBvciBodW5kcmVkc8Kg
bXMuCj4+Cj4gCj4gUGxlYXNlIHNlbmQgcGF0Y2hlcyBhcyBwcm9wZXIgZW1haWxzIChtYW4gZ2l0
LWZvcm1hdC1wYXRjaDsgbWFuIGdpdC1zZW5kLWVtYWlsKS4KPiAKPiBXaGF0IHlvdSBwcm9wb3Nl
IGlzIHR1cm5pbmcgY21hIHJlc2VydmF0aW9ucyBpbnRvIHNvbWV0aGluZyBjb21wYXJhYmxlIHRv
IHBlcm1hbmVudCBib290dGltZSBhbGxvY2F0aW9ucy4gRnJvbSB0aGUgUE9WIG9mIHRoZSBidWRk
eSwgdGhlIHBhZ2VzIGFyZSBhbHdheXMgYWxsb2NhdGVkIGFuZCBjYW5ub3QgYmUgcmVwdXJwb3Nl
ZCBmb3IgZS5nLiwgbW92YWJsZSBhbGxvY2F0aW9ucyB1bnRpbCAqYWN0dWFsbHkqIGFsbG9jYXRl
ZCB2aWEgQ01BLgo+IAo+IEkgZG9uJ3QgdGhpbmsgd2Ugd2FudCB0aGlzIGJlaGF2aW9yIHVwc3Ry
ZWFtLgo+IAo+IC0tCj4gVGhhbmtzLAo+IAo+IERhdmlkIC8gZGhpbGRlbmIKPiAKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW9tbXUgbWFpbGluZyBsaXN0
CmlvbW11QGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3Vu
ZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lvbW11
