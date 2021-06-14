Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBC33A68BF
	for <lists.iommu@lfdr.de>; Mon, 14 Jun 2021 16:11:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E641560596;
	Mon, 14 Jun 2021 14:11:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qlshcuqeQixs; Mon, 14 Jun 2021 14:11:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id EA54A600C9;
	Mon, 14 Jun 2021 14:11:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B88FEC0024;
	Mon, 14 Jun 2021 14:11:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 985BBC000B
 for <iommu@lists.linux-foundation.org>; Mon, 14 Jun 2021 14:11:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 788DD600C9
 for <iommu@lists.linux-foundation.org>; Mon, 14 Jun 2021 14:11:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KzPfDPe4Obrt for <iommu@lists.linux-foundation.org>;
 Mon, 14 Jun 2021 14:11:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp3.osuosl.org (Postfix) with ESMTP id C07DC600B5
 for <iommu@lists.linux-foundation.org>; Mon, 14 Jun 2021 14:11:53 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0969C1FB;
 Mon, 14 Jun 2021 07:11:53 -0700 (PDT)
Received: from [10.57.9.136] (unknown [10.57.9.136])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7F9373F70D;
 Mon, 14 Jun 2021 07:11:51 -0700 (PDT)
Subject: Re: [PATCH v12 3/5] iommu/vt-d: Add support for IOMMU default DMA
 mode build options
To: John Garry <john.garry@huawei.com>, Lu Baolu <baolu.lu@linux.intel.com>,
 joro@8bytes.org, will@kernel.org, dwmw2@infradead.org
References: <1623414043-40745-1-git-send-email-john.garry@huawei.com>
 <1623414043-40745-4-git-send-email-john.garry@huawei.com>
 <4f2cec34-bad9-e1bf-85c1-04d1a0c1aecf@linux.intel.com>
 <6055cd0d-a1d3-a73a-6831-3837021f3c9c@huawei.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <0a04f964-80f4-7b2a-9740-eae4596e4e09@arm.com>
Date: Mon, 14 Jun 2021 15:11:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <6055cd0d-a1d3-a73a-6831-3837021f3c9c@huawei.com>
Content-Language: en-GB
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 linuxarm@huawei.com
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

T24gMjAyMS0wNi0xNCAwODo1MywgSm9obiBHYXJyeSB3cm90ZToKPiBPbiAxMi8wNi8yMDIxIDAz
OjIyLCBMdSBCYW9sdSB3cm90ZToKPj4gT24gMjAyMS82LzExIDIwOjIwLCBKb2huIEdhcnJ5IHdy
b3RlOgo+Pj4gQEAgLTQ1Myw4ICs0NTIsNyBAQCBzdGF0aWMgaW50IF9faW5pdCBpbnRlbF9pb21t
dV9zZXR1cChjaGFyICpzdHIpCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwcl93YXJu
KCJpbnRlbF9pb21tdT1mb3JjZWRhYyBkZXByZWNhdGVkOyB1c2UgCj4+PiBpb21tdS5mb3JjZWRh
YyBpbnN0ZWFkXG4iKTsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlvbW11X2RtYV9m
b3JjZWRhYyA9IHRydWU7Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgfSBlbHNlIGlmICghc3RybmNt
cChzdHIsICJzdHJpY3QiLCA2KSkgewo+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcHJfaW5m
bygiRGlzYWJsZSBiYXRjaGVkIElPVExCIGZsdXNoXG4iKTsKPj4+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGludGVsX2lvbW11X3N0cmljdCA9IDE7Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBpb21tdV9zZXRfZG1hX3N0cmljdCh0cnVlKTsKPj4KPj4gSSB3b3VsZCBsaWtlIHRvIGRlcHJl
Y2F0ZSB0aGlzIGNvbW1hbmQgbGluZSBhbmQgYXNrIHVzZXJzIHRvIHVzZQo+PiBpb21tdS5zdHJp
Y3QgaW5zdGVhZC4KPiAKPiBvaywgYnV0IHRoZW4gSSBzaG91bGQgcHJvYmFibHkgbWFrZSB0aGUg
QU1EIGRyaXZlciBhbHNvIG9mZmljaWFsbHkgCj4gc3VwcG9ydCB0aGlzLgoKT29wcywgSSBzaG91
bGQgaGF2ZSBkb2N1bWVudGVkIHRoYXQgImlvbW11LnN0cmljdCIgYWxyZWFkeSBhcHBsaWVzIHRv
IAp4ODYgYXMgd2VsbC4gVGhlIGludGVyYWN0aW9uIHdpdGggdGhlIGRyaXZlci1zcGVjaWZpYyBw
YXJhbWV0ZXJzIGlzIGEgCmJpdCB3ZWlyZCBhbmQgdW5pbnR1aXRpdmUsIGJ1dCBpdCB3YXMgZG9u
ZSBrbm93aW5nbHkuIExldCBtZSBxdWlja2x5IApzcGluIGEga2VybmVsLXBhcmFtZXRlcnMudHh0
IGZpeCBmb3IgdGhhdC4uLgoKQ2hlZXJzLApSb2Jpbi4KCj4+Cj4+IC0tLSBhL2RyaXZlcnMvaW9t
bXUvaW50ZWwvaW9tbXUuYwo+PiArKysgYi9kcml2ZXJzL2lvbW11L2ludGVsL2lvbW11LmMKPj4g
QEAgLTQzNiw3ICs0MzYsNyBAQCBzdGF0aWMgaW50IF9faW5pdCBpbnRlbF9pb21tdV9zZXR1cChj
aGFyICpzdHIpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBwcl93YXJuKCJpbnRlbF9pb21tdT1mb3JjZWRhYyBkZXByZWNhdGVkOyB1c2UgCj4+IGlv
bW11LmZvcmNlZGFjIGluc3RlYWRcbiIpOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgaW9tbXVfZG1hX2ZvcmNlZGFjID0gdHJ1ZTsKPj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfSBlbHNlIGlmICghc3RybmNtcChzdHIsICJzdHJp
Y3QiLCA2KSkgewo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgcHJfaW5mbygiRGlzYWJsZSBiYXRjaGVkIElPVExCIGZsdXNoXG4iKTsKPj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHByX3dhcm4oImludGVsX2lvbW11
PXN0cmljdCBkZXByZWNhdGVkOyB1c2UgCj4+IGlvbW11LnN0cmljdCBpbnN0ZWFkXG4iKTsKPj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGludGVsX2lv
bW11X3N0cmljdCA9IDE7Cj4+Cj4+IEFsc28gdXBkYXRlIERvY3VtZW50YXRpb24vYWRtaW4tZ3Vp
ZGUva2VybmVsLXBhcmFtZXRlcnMudHh0IGFjY29yZGluZ2x5Lgo+IAo+IFRoYW5rcywKPiBKb2hu
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlvbW11IG1h
aWxpbmcgbGlzdAppb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3Rz
LmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9pb21tdQ==
