Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5B33411DE
	for <lists.iommu@lfdr.de>; Fri, 19 Mar 2021 02:02:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AEAA54BA7C;
	Fri, 19 Mar 2021 01:02:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CzUctHj9f-Pt; Fri, 19 Mar 2021 01:02:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8765D4AD51;
	Fri, 19 Mar 2021 01:02:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5B6D5C0010;
	Fri, 19 Mar 2021 01:02:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 40BA2C0001
 for <iommu@lists.linux-foundation.org>; Fri, 19 Mar 2021 01:02:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 237FC82B84
 for <iommu@lists.linux-foundation.org>; Fri, 19 Mar 2021 01:02:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Me6C6ZckrrFU for <iommu@lists.linux-foundation.org>;
 Fri, 19 Mar 2021 01:02:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DE54682A5D
 for <iommu@lists.linux-foundation.org>; Fri, 19 Mar 2021 01:02:36 +0000 (UTC)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4F1lvH2H3gzkbgW;
 Fri, 19 Mar 2021 09:00:59 +0800 (CST)
Received: from [127.0.0.1] (10.40.193.166) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.498.0; Fri, 19 Mar 2021
 09:02:30 +0800
Subject: Re: [PATCH] iommu/dma: Fix a typo in a comment
To: Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>
References: <1616037684-59399-1-git-send-email-chenxiang66@hisilicon.com>
 <20210318093410.GA6574@willie-the-truck>
 <c378734f-33d5-1426-fa41-2bd8064ceec4@hisilicon.com>
 <8eef75b4-8f69-3dff-d46a-170aa8b30a53@arm.com>
From: "chenxiang (M)" <chenxiang66@hisilicon.com>
Message-ID: <4d91b623-fc29-5886-6972-0325b00df164@hisilicon.com>
Date: Fri, 19 Mar 2021 09:02:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <8eef75b4-8f69-3dff-d46a-170aa8b30a53@arm.com>
X-Originating-IP: [10.40.193.166]
X-CFilter-Loop: Reflected
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

SGksCgoK5ZyoIDIwMjEvMy8xOCAxOTowMSwgUm9iaW4gTXVycGh5IOWGmemBkzoKPiBPbiAyMDIx
LTAzLTE4IDA5OjU1LCBjaGVueGlhbmcgKE0pIHdyb3RlOgo+PiBIaSB3aWxsLAo+Pgo+Pgo+PiDl
nKggMjAyMS8zLzE4IDE3OjM0LCBXaWxsIERlYWNvbiDlhpnpgZM6Cj4+PiBPbiBUaHUsIE1hciAx
OCwgMjAyMSBhdCAxMToyMToyNEFNICswODAwLCBjaGVueGlhbmcgd3JvdGU6Cj4+Pj4gRnJvbTog
WGlhbmcgQ2hlbiA8Y2hlbnhpYW5nNjZAaGlzaWxpY29uLmNvbT4KPj4+Pgo+Pj4+IEZpeCBhIHR5
cGUgIlNBQyIgdG8gIkRBQyIgaW4gdGhlIGNvbW1lbnQgb2YgZnVuY3Rpb24KPj4+PiBpb21tdV9k
bWFfYWxsb2NfaW92YSgpLgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogWGlhbmcgQ2hlbiA8Y2hl
bnhpYW5nNjZAaGlzaWxpY29uLmNvbT4KPj4+PiAtLS0KPj4+PiAgIGRyaXZlcnMvaW9tbXUvZG1h
LWlvbW11LmMgfCAyICstCj4+Pj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lvbW11L2RtYS1pb21t
dS5jIGIvZHJpdmVycy9pb21tdS9kbWEtaW9tbXUuYwo+Pj4+IGluZGV4IGFmNzY1YzguLjNiYzE3
ZWUgMTAwNjQ0Cj4+Pj4gLS0tIGEvZHJpdmVycy9pb21tdS9kbWEtaW9tbXUuYwo+Pj4+ICsrKyBi
L2RyaXZlcnMvaW9tbXUvZG1hLWlvbW11LmMKPj4+PiBAQCAtNDQzLDcgKzQ0Myw3IEBAIHN0YXRp
YyBkbWFfYWRkcl90IGlvbW11X2RtYV9hbGxvY19pb3ZhKHN0cnVjdCAKPj4+PiBpb21tdV9kb21h
aW4gKmRvbWFpbiwKPj4+PiAgICAgICBpZiAoZG9tYWluLT5nZW9tZXRyeS5mb3JjZV9hcGVydHVy
ZSkKPj4+PiAgICAgICAgICAgZG1hX2xpbWl0ID0gbWluKGRtYV9saW1pdCwgCj4+Pj4gKHU2NClk
b21haW4tPmdlb21ldHJ5LmFwZXJ0dXJlX2VuZCk7Cj4+Pj4gLSAgICAvKiBUcnkgdG8gZ2V0IFBD
SSBkZXZpY2VzIGEgU0FDIGFkZHJlc3MgKi8KPj4+PiArICAgIC8qIFRyeSB0byBnZXQgUENJIGRl
dmljZXMgYSBEQUMgYWRkcmVzcyAqLwo+Pj4+ICAgICAgIGlmIChkbWFfbGltaXQgPiBETUFfQklU
X01BU0soMzIpICYmIGRldl9pc19wY2koZGV2KSkKPj4+PiAgICAgICAgICAgaW92YSA9IGFsbG9j
X2lvdmFfZmFzdChpb3ZhZCwgaW92YV9sZW4sCj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAg
IERNQV9CSVRfTUFTSygzMikgPj4gc2hpZnQsIGZhbHNlKTsKPj4+IFRoaXMgZG9lc24ndCBsb29r
IGxpa2UgYSB0eXBvIHRvIG1lLi4uIFBsZWFzZSBleHBsYWluLgo+Cj4gQXMgdGhlIGF1dGhvciBv
ZiBzYWlkIGNvbW1lbnQsIGl0IGlzIGRlZmluaXRlbHkgbm90IGEgdHlwby4KCldoYXQncyB0aGUg
c2hvcnQgZm9yIFNBQz8KCj4KPj4gSSB0aGluayBpdCBtZWFucyBkb3VibGUtYWRkcmVzcyBjeWNs
ZShEQUMpLCBhbmQgaW4gTExEMyA0NTIgcGFnZSwgCj4+IHRoZXJlIGlzIGEgZGVzY3JpcHRpb24g
YWJvdXQgaXQgIlBDSSBkb3VibGUtYWRkcmVzcyBjeWNsZSBtYXBwaW5ncyAKPj4gTm9ybWFsbHks
Cj4+IHRoZSBETUEgc3VwcG9ydCBsYXllciB3b3JrcyB3aXRoIDMyLWJpdCBidXMgYWRkcmVzc2Vz
LCBwb3NzaWJseSAKPj4gcmVzdHJpY3RlZCBieSBhIHNwZWNpZmljIGRldmljZeKAmXMgRE1BIG1h
c2suIFRoZSBQQ0kgYnVzLCBob3dldmVyLCAKPj4gYWxzbyBzdXBwb3J0cyBhIDY0LWJpdCBhZGRy
ZXNzaW5nIG1vZGUsIHRoZSBkb3VibGUtYWRkcmVzcyBjeWNsZSAoREFDKS4iCj4+IFBsZWFzZSBw
b2ludCBpdCBvdXQgaWYgaSBhbSB3cm9uZyA6KQo+Cj4gWWVzLCBub3cgbG9vayBhdCB3aGF0IHRo
ZSBjb2RlIGFib3ZlIGRvZXM6ICppZiogYSBQQ0kgZGV2aWNlIGhhcyBhIERNQSAKPiBtYXNrIGdy
ZWF0ZXIgdGhhbiAzMiBiaXRzIChpLmUuIGNhbiBzdXBwb3J0IGR1YWwgYWRkcmVzcyBjeWNsZXMp
LCB3ZSAKPiBmaXJzdCB0cnkgYW4gSU9WQSBhbGxvY2F0aW9uIHdpdGggYW4gZXhwbGljaXQgMzIt
Yml0IGxpbWl0IChpLmUuIHRoYXQgCj4gY2FuIGJlIGV4cHJlc3NlZCBpbiBhIHNpbmdsZSBhZGRy
ZXNzIGN5Y2xlKSwgaW4gdGhlIGhvcGUgdGhhdCB3ZSBkb24ndCAKPiBoYXZlIHRvIGZhbGwgYmFj
ayB0byBhbGxvY2F0aW5nIGZyb20gdGhlIHVwcGVyIHJhbmdlIGFuZCBmb3JjaW5nIHRoZSAKPiBk
ZXZpY2UgdG8gYWN0dWFsbHkgdXNlIERBQyAoYW5kIHN1ZmZlciB0aGUgcG90ZW50aWFsIHBlcmZv
cm1hbmNlIGltcGFjdCkuCj4KPiBSb2Jpbi4KPgo+IC4KPgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmlvbW11IG1haWxpbmcgbGlzdAppb21tdUBsaXN0
cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcv
bWFpbG1hbi9saXN0aW5mby9pb21tdQ==
