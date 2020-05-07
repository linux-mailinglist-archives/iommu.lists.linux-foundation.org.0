Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D571C86D1
	for <lists.iommu@lfdr.de>; Thu,  7 May 2020 12:33:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 00C1387402;
	Thu,  7 May 2020 10:33:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CtAscDvWwyBN; Thu,  7 May 2020 10:33:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 40E0C873F3;
	Thu,  7 May 2020 10:33:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 38AC3C07FF;
	Thu,  7 May 2020 10:33:44 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 03FD4C07FF
 for <iommu@lists.linux-foundation.org>; Thu,  7 May 2020 10:33:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D0190255A6
 for <iommu@lists.linux-foundation.org>; Thu,  7 May 2020 10:33:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SFu8H3OqYSpt for <iommu@lists.linux-foundation.org>;
 Thu,  7 May 2020 10:33:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by silver.osuosl.org (Postfix) with ESMTP id 61E85262F9
 for <iommu@lists.linux-foundation.org>; Thu,  7 May 2020 10:33:41 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 98D8ED6E;
 Thu,  7 May 2020 03:33:40 -0700 (PDT)
Received: from [10.57.36.85] (unknown [10.57.36.85])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 58E6F3F71F;
 Thu,  7 May 2020 03:33:39 -0700 (PDT)
Subject: Re: [PATCHv2] iommu/arm-smmu: Make remove callback message more
 informative
To: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Doug Anderson <dianders@chromium.org>, Will Deacon <will@kernel.org>
References: <20200423095531.9868-1-saiprakash.ranjan@codeaurora.org>
 <CAD=FV=W=d=KrTwgMOO-ukFc7ZhkE92qGYumUEDrtjmhQOpdWbg@mail.gmail.com>
 <CAD=FV=U0Hhae3D1-P8kbcZafHeuqng11BNAbOb2YWPx+M7X5Gw@mail.gmail.com>
 <0b5098c28360d018f390a97155b9776c@codeaurora.org>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <2f3cd963-dffe-290b-02bf-819687713738@arm.com>
Date: Thu, 7 May 2020 11:33:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <0b5098c28360d018f390a97155b9776c@codeaurora.org>
Content-Language: en-GB
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 iommu@lists.linux-foundation.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
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

T24gMjAyMC0wNS0wNyAxMTowNCBhbSwgU2FpIFByYWthc2ggUmFuamFuIHdyb3RlOgo+IEhpLAo+
IAo+IE9uIDIwMjAtMDUtMDcgMDU6NDAsIERvdWcgQW5kZXJzb24gd3JvdGU6Cj4+IEhpLAo+Pgo+
PiBPbiBUaHUsIEFwciAyMywgMjAyMCBhdCA3OjM1IEFNIERvdWcgQW5kZXJzb24gPGRpYW5kZXJz
QGNocm9taXVtLm9yZz4gCj4+IHdyb3RlOgo+Pj4KPj4+IEhpLAo+Pj4KPj4+IE9uIFRodSwgQXBy
IDIzLCAyMDIwIGF0IDI6NTUgQU0gU2FpIFByYWthc2ggUmFuamFuCj4+PiA8c2FpcHJha2FzaC5y
YW5qYW5AY29kZWF1cm9yYS5vcmc+IHdyb3RlOgo+Pj4gPgo+Pj4gPiBDdXJyZW50bHkgb24gcmVi
b290L3NodXRkb3duLCB0aGUgZm9sbG93aW5nIG1lc3NhZ2VzIGFyZQo+Pj4gPiBkaXNwbGF5ZWQg
b24gdGhlIGNvbnNvbGUgYXMgZXJyb3IgbWVzc2FnZXMgYmVmb3JlIHRoZQo+Pj4gPiBzeXN0ZW0g
cmVib290cy9zaHV0ZG93biBhcyBwYXJ0IG9mIHJlbW92ZSBjYWxsYmFjay4KPj4+ID4KPj4+ID4g
T24gU0M3MTgwOgo+Pj4gPgo+Pj4gPsKgwqAgYXJtLXNtbXUgMTUwMDAwMDAuaW9tbXU6IHJlbW92
aW5nIGRldmljZSB3aXRoIGFjdGl2ZSBkb21haW5zIQo+Pj4gPsKgwqAgYXJtLXNtbXUgNTA0MDAw
MC5pb21tdTogcmVtb3ZpbmcgZGV2aWNlIHdpdGggYWN0aXZlIGRvbWFpbnMhCj4+PiA+Cj4+PiA+
IE1ha2UgdGhpcyBlcnJvciBtZXNzYWdlIG1vcmUgaW5mb3JtYXRpdmUgYW5kIGxlc3Mgc2Nhcnku
Cj4+PiA+Cj4+PiA+IFJlcG9ydGVkLWJ5OiBEb3VnbGFzIEFuZGVyc29uIDxkaWFuZGVyc0BjaHJv
bWl1bS5vcmc+Cj4+PiA+IFN1Z2dlc3RlZC1ieTogUm9iaW4gTXVycGh5IDxyb2Jpbi5tdXJwaHlA
YXJtLmNvbT4KPj4+ID4gU2lnbmVkLW9mZi1ieTogU2FpIFByYWthc2ggUmFuamFuIDxzYWlwcmFr
YXNoLnJhbmphbkBjb2RlYXVyb3JhLm9yZz4KPj4+ID4gLS0tCj4+PiA+wqAgZHJpdmVycy9pb21t
dS9hcm0tc21tdS5jIHwgMiArLQo+Pj4gPsKgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQo+Pj4KPj4+IFJldmlld2VkLWJ5OiBEb3VnbGFzIEFuZGVyc29uIDxk
aWFuZGVyc0BjaHJvbWl1bS5vcmc+Cj4+Cj4+IElzIHRoaXMgcGF0Y2ggd2FpdGluZyBvbiBhbnl0
aGluZyBpbiBwYXJ0aWN1bGFyIG5vdz/CoCBEbyB3ZSBuZWVkCj4+IHJldmlld3MgZnJvbSBSb2Jp
biBhbmQvb3IgV2lsbD8KPj4KPiAKPiBXYWl0aW5nIGZvciB0aGVpciByZXZpZXdzIGFzIHRoZXkg
YXJlIHRoZSBtYWludGFpbmVycy9yZXZpZXdlcnMgOikKClNvcnJ5LCB0aGlzIGRpZCByZWdpc3Rl
ciBhdCB0aGUgdGltZSwgSSBqdXN0IGZlbHQgdGhhdCBpdCdzIGEgYml0IApyZWR1bmRhbnQgdG8g
Z2l2ZSBhIHJldmlldyB0YWcgdG8gc2F5ICJ5ZXMsIHRoaXMgaXMgZXhhY3RseSB3aGF0IEkgCnN1
Z2dlc3RlZCIgOikKClRoYXQgc2FpZCwgSSBkbyB3aXNoIEkgaGFkbid0IGZvcmdvdHRlbiBhYm91
dCB0aGUgZGV2X25vdGljZSBtZXNzYWdlIApsZXZlbCwgYnV0IEkgdGhpbmsgdGhhdCBsaWVzIG92
ZXIgaW4gdGhlIGNvbmNlcHR1YWwgcHVyaXR5IGNvcm5lciByYXRoZXIgCnRoYW4gbWFraW5nIGFu
eSBwcmFjdGljYWwgZGlmZmVyZW5jZSwgc28gSSdtIHN0aWxsIE9LIHdpdGggdGhlIHBhdGNoIAph
cy1pcy4gV2lsbD8KClJvYmluLgoKCnAucy4gd2hvZXZlciBoYXMgdGhpcyBlbnRyeSBpbiB0aGVp
ciBhZGRyZXNzIGJvb2sgZm9yIHRoZSBJT01NVSBsaXN0IAooRG91Zz8pOgoKImxpc3RAMjYzLm5l
dDpJT01NVSBEUklWRVJTIDxpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZz4sIEpvZXJn
IApSb2VkZWwgPGpvcm9AOGJ5dGVzLm9yZz4sIiA8aW9tbXVAbGlzdHMubGludXgtZm91bmRhdGlv
bi5vcmc+CgppdCByZWFsbHkgbWVzc2VzIHVwIFRodW5kZXJiaXJkJ3MgYWJpbGl0eSB0byBnZW5l
cmF0ZSB3b3JraW5nIGhlYWRlcnMgCmZvciBhIHJlcGx5IDspCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmlvbW11IG1haWxpbmcgbGlzdAppb21tdUBsaXN0
cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcv
bWFpbG1hbi9saXN0aW5mby9pb21tdQ==
