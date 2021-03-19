Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 863C0341AB7
	for <lists.iommu@lfdr.de>; Fri, 19 Mar 2021 12:03:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F09083B59;
	Fri, 19 Mar 2021 11:03:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BQDFUVvVsOaM; Fri, 19 Mar 2021 11:02:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EEBB83A49;
	Fri, 19 Mar 2021 11:02:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1FBE6C0012;
	Fri, 19 Mar 2021 11:02:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 41D5BC000B
 for <iommu@lists.linux-foundation.org>; Fri, 19 Mar 2021 11:02:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2977040112
 for <iommu@lists.linux-foundation.org>; Fri, 19 Mar 2021 11:02:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mo_1cjA7-sRg for <iommu@lists.linux-foundation.org>;
 Fri, 19 Mar 2021 11:02:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp2.osuosl.org (Postfix) with ESMTP id 55D65400A8
 for <iommu@lists.linux-foundation.org>; Fri, 19 Mar 2021 11:02:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 61EFAED1;
 Fri, 19 Mar 2021 04:02:55 -0700 (PDT)
Received: from [10.57.50.37] (unknown [10.57.50.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BAF5E3F70D;
 Fri, 19 Mar 2021 04:02:54 -0700 (PDT)
Subject: Re: [PATCH] iommu/dma: Fix a typo in a comment
To: "chenxiang (M)" <chenxiang66@hisilicon.com>, Will Deacon <will@kernel.org>
References: <1616037684-59399-1-git-send-email-chenxiang66@hisilicon.com>
 <20210318093410.GA6574@willie-the-truck>
 <c378734f-33d5-1426-fa41-2bd8064ceec4@hisilicon.com>
 <8eef75b4-8f69-3dff-d46a-170aa8b30a53@arm.com>
 <4d91b623-fc29-5886-6972-0325b00df164@hisilicon.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <b3badca4-7262-3e11-c78e-e6709760840a@arm.com>
Date: Fri, 19 Mar 2021 11:02:49 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <4d91b623-fc29-5886-6972-0325b00df164@hisilicon.com>
Content-Language: en-GB
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

T24gMjAyMS0wMy0xOSAwMTowMiwgY2hlbnhpYW5nIChNKSB3cm90ZToKPiBIaSwKPiAKPiAKPiDl
nKggMjAyMS8zLzE4IDE5OjAxLCBSb2JpbiBNdXJwaHkg5YaZ6YGTOgo+PiBPbiAyMDIxLTAzLTE4
IDA5OjU1LCBjaGVueGlhbmcgKE0pIHdyb3RlOgo+Pj4gSGkgd2lsbCwKPj4+Cj4+Pgo+Pj4g5Zyo
IDIwMjEvMy8xOCAxNzozNCwgV2lsbCBEZWFjb24g5YaZ6YGTOgo+Pj4+IE9uIFRodSwgTWFyIDE4
LCAyMDIxIGF0IDExOjIxOjI0QU0gKzA4MDAsIGNoZW54aWFuZyB3cm90ZToKPj4+Pj4gRnJvbTog
WGlhbmcgQ2hlbiA8Y2hlbnhpYW5nNjZAaGlzaWxpY29uLmNvbT4KPj4+Pj4KPj4+Pj4gRml4IGEg
dHlwZSAiU0FDIiB0byAiREFDIiBpbiB0aGUgY29tbWVudCBvZiBmdW5jdGlvbgo+Pj4+PiBpb21t
dV9kbWFfYWxsb2NfaW92YSgpLgo+Pj4+Pgo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBYaWFuZyBDaGVu
IDxjaGVueGlhbmc2NkBoaXNpbGljb24uY29tPgo+Pj4+PiAtLS0KPj4+Pj4gwqAgZHJpdmVycy9p
b21tdS9kbWEtaW9tbXUuYyB8IDIgKy0KPj4+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4+Pj4+Cj4+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lv
bW11L2RtYS1pb21tdS5jIGIvZHJpdmVycy9pb21tdS9kbWEtaW9tbXUuYwo+Pj4+PiBpbmRleCBh
Zjc2NWM4Li4zYmMxN2VlIDEwMDY0NAo+Pj4+PiAtLS0gYS9kcml2ZXJzL2lvbW11L2RtYS1pb21t
dS5jCj4+Pj4+ICsrKyBiL2RyaXZlcnMvaW9tbXUvZG1hLWlvbW11LmMKPj4+Pj4gQEAgLTQ0Myw3
ICs0NDMsNyBAQCBzdGF0aWMgZG1hX2FkZHJfdCBpb21tdV9kbWFfYWxsb2NfaW92YShzdHJ1Y3Qg
Cj4+Pj4+IGlvbW11X2RvbWFpbiAqZG9tYWluLAo+Pj4+PiDCoMKgwqDCoMKgIGlmIChkb21haW4t
Pmdlb21ldHJ5LmZvcmNlX2FwZXJ0dXJlKQo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZG1hX2xp
bWl0ID0gbWluKGRtYV9saW1pdCwgCj4+Pj4+ICh1NjQpZG9tYWluLT5nZW9tZXRyeS5hcGVydHVy
ZV9lbmQpOwo+Pj4+PiAtwqDCoMKgIC8qIFRyeSB0byBnZXQgUENJIGRldmljZXMgYSBTQUMgYWRk
cmVzcyAqLwo+Pj4+PiArwqDCoMKgIC8qIFRyeSB0byBnZXQgUENJIGRldmljZXMgYSBEQUMgYWRk
cmVzcyAqLwo+Pj4+PiDCoMKgwqDCoMKgIGlmIChkbWFfbGltaXQgPiBETUFfQklUX01BU0soMzIp
ICYmIGRldl9pc19wY2koZGV2KSkKPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGlvdmEgPSBhbGxv
Y19pb3ZhX2Zhc3QoaW92YWQsIGlvdmFfbGVuLAo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgRE1BX0JJVF9NQVNLKDMyKSA+PiBzaGlmdCwgZmFs
c2UpOwo+Pj4+IFRoaXMgZG9lc24ndCBsb29rIGxpa2UgYSB0eXBvIHRvIG1lLi4uIFBsZWFzZSBl
eHBsYWluLgo+Pgo+PiBBcyB0aGUgYXV0aG9yIG9mIHNhaWQgY29tbWVudCwgaXQgaXMgZGVmaW5p
dGVseSBub3QgYSB0eXBvLgo+IAo+IFdoYXQncyB0aGUgc2hvcnQgZm9yIFNBQz8KClNpbmdsZSBB
ZGRyZXNzIEN5Y2xlIC0gdGhpcyBpcyBzdGFuZGFyZCB0ZXJtaW5vbG9neSBmcm9tIHRoZSBQQ0kg
c3BlYy4KClJvYmluLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwppb21tdSBtYWlsaW5nIGxpc3QKaW9tbXVAbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcK
aHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vaW9tbXU=
