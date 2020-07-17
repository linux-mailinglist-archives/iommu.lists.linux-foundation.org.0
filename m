Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2C42238A6
	for <lists.iommu@lfdr.de>; Fri, 17 Jul 2020 11:47:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4A45988301;
	Fri, 17 Jul 2020 09:47:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yO4PiWwzR09f; Fri, 17 Jul 2020 09:47:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2DD38882F3;
	Fri, 17 Jul 2020 09:47:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 20E6EC0733;
	Fri, 17 Jul 2020 09:47:19 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CD072C0733
 for <iommu@lists.linux-foundation.org>; Fri, 17 Jul 2020 09:47:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B4C7B88299
 for <iommu@lists.linux-foundation.org>; Fri, 17 Jul 2020 09:47:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ha9VnJYJ6Nud for <iommu@lists.linux-foundation.org>;
 Fri, 17 Jul 2020 09:47:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0226288294
 for <iommu@lists.linux-foundation.org>; Fri, 17 Jul 2020 09:47:16 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4CBE830E;
 Fri, 17 Jul 2020 02:47:16 -0700 (PDT)
Received: from [10.57.35.46] (unknown [10.57.35.46])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 45DDD3F66E;
 Fri, 17 Jul 2020 02:47:15 -0700 (PDT)
Subject: Re: [PATCH v2 0/3] iommu/amd: I/O VA address limits
To: Sebastian Ott <sebott@amazon.de>, Joerg Roedel <joro@8bytes.org>
References: <20200630093039.GC28824@8bytes.org>
 <20200630224634.319-1-sebott@amazon.de> <20200710123059.GF27672@8bytes.org>
 <751e403f-7095-f761-465b-9e187b423b0b@amazon.de>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <271d67b2-482e-7a16-8fd7-1f1a6a4bdff2@arm.com>
Date: Fri, 17 Jul 2020 10:47:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <751e403f-7095-f761-465b-9e187b423b0b@amazon.de>
Content-Language: en-GB
Cc: Benjamin Serebrin <serebrin@amazon.com>, Filippo Sironi <sironi@amazon.de>,
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

T24gMjAyMC0wNy0xNyAxMDoyMCwgU2ViYXN0aWFuIE90dCB2aWEgaW9tbXUgd3JvdGU6Cj4gSGVs
bG8gSm9lcmcsCj4gCj4gT24gMjAyMC0wNy0xMCAxNDozMSwgSm9lcmcgUm9lZGVsIHdyb3RlOgo+
PiBPbiBXZWQsIEp1bCAwMSwgMjAyMCBhdCAxMjo0NjozMUFNICswMjAwLCBTZWJhc3RpYW4gT3R0
IHdyb3RlOgo+Pj4gVGhlIElWUlMgQUNQSSB0YWJsZSBzcGVjaWZpZXMgbWF4aW11bSBhZGRyZXNz
IHNpemVzIGZvciBJL08gdmlydHVhbAo+Pj4gYWRkcmVzc2VzIHRoYXQgY2FuIGJlIGhhbmRsZWQg
YnkgdGhlIElPTU1VcyBpbiB0aGUgc3lzdGVtLiBQYXJzZSB0aGF0Cj4+PiBkYXRhIGZyb20gdGhl
IElWUlMgaGVhZGVyIHRvIHByb3ZpZGUgYXBlcnR1cmUgaW5mb3JtYXRpb24gZm9yIERNQQo+Pj4g
bWFwcGluZ3MgYW5kIHVzZXJzIG9mIHRoZSBpb21tdSBBUEkuCj4+Pgo+Pj4gQ2hhbmdlcyBmb3Ig
VjI6Cj4+PiDCoCAtIHVzZSBsaW1pdHMgaW4gaW9tbXVfc2V0dXBfZG1hX29wcygpCj4+PiDCoCAt
IHJlYmFzZWQgdG8gY3VycmVudCB1cHN0cmVhbQo+Pj4KPj4+IFNlYmFzdGlhbiBPdHQgKDMpOgo+
Pj4gwqDCoCBpb21tdS9hbWQ6IFBhcnNlIHN1cHBvcnRlZCBhZGRyZXNzIHNpemVzIGZyb20gSVZS
Uwo+Pj4gwqDCoCBpb21tdS9hbWQ6IFJlc3RyaWN0IGFwZXJ0dXJlIGZvciBkb21haW5zIHRvIGNv
bmZvcm0gd2l0aCBJVlJTCj4+PiDCoMKgIGlvbW11L2FtZDogQWN0dWFsbHkgZW5mb3JjZSBnZW9t
ZXRyeSBhcGVydHVyZQo+PiBUaGFua3MgZm9yIHRoZSBjaGFuZ2VzLiBNYXkgSSBhc2sgd2hhdCB0
aGUgcmVhc29uIGZvciB0aG9zZSBjaGFuZ2VzIGFyZT8KPj4gQUZBSUsgYWxsIEFNRCBJT01NVSBp
bXBsZW1lbnRhdGlvbnMgKGluIGhhcmR3YXJlKSBzdXBwb3J0IGZ1bGwgNjRiaXQKPj4gYWRkcmVz
cyBzcGFjZXMsIGFuZCB0aGUgSVZSUyB0YWJsZSBtaWdodCBhY3R1YWxseSBiZSB3cm9uZywgbGlt
aXRpbmcgdGhlCj4+IGFkZHJlc3Mgc3BhY2UgaW4gdGhlIHdvcnN0IGNhc2UgdG8gb25seSAzMiBi
aXQuCj4gCj4gSXQncyBub3QgdGhlIElPTU1VLCBidXQgd2UndmUgZW5jb3VudGVyZWQgZGV2aWNl
cyB0aGF0IGFyZSBjYXBhYmxlIG9mIAo+IG1vcmUgdGhhbgo+IDMyLSBidXQgbGVzcyB0aGFuIDY0
LSBiaXQgSU9WQSwgYW5kIHRoZXJlJ3Mgbm8gd2F5IHRvIGV4cHJlc3MgdGhhdCB0byAKPiB0aGUg
SU9WQQo+IGFsbG9jYXRvciBpbiB0aGUgUENJZSBzcGVjLiBPdXIgc29sdXRpb24gd2FzIHRvIGhh
dmUgb3VyIHBsYXRmb3JtcyAKPiBleHByZXNzIGFuCj4gSVZSUyBlbnRyeSB0aGF0IHNheXMgdGhl
IElPTU1VIGlzIGNhcGFibGUgb2YgNDgtYml0LCB3aGljaCB0aGVzZSBkZXZpY2VzIAo+IGNhbiBn
ZW5lcmF0ZS4KPiA0OCBiaXRzIGlzIHBsZW50eSBvZiBhZGRyZXNzIHNwYWNlIGluIHRoaXMgZ2Vu
ZXJhdGlvbiBmb3IgdGhlIAo+IGFwcGxpY2F0aW9uIHdlIGhhdmUuCgpIbW0sIGZvciBjb25zdHJh
aW50cyBvZiBpbmRpdmlkdWFsIGRldmljZXMsIGl0IHNob3VsZCByZWFsbHkgYmUgdGhlaXIgCmRy
aXZlcnMnIGpvYiB0byBjYWxsIGRtYV9zZXRfbWFzayooKSB3aXRoIHRoZSBhcHByb3ByaWF0ZSB2
YWx1ZSBpbiB0aGUgCmZpcnN0IHBsYWNlIHJhdGhlciB0aGFuIGp1c3QgYXNzdW1pbmcgdGhhdCA2
NCBtZWFucyBhbnl0aGluZyA+MzIuIElmIAppdCdzIGEgY2FzZSB3aGVyZSB0aGUgZGV2aWNlIGl0
c2VsZiB0ZWNobmljYWxseSBpcyA2NC1iaXQgY2FwYWJsZSwgYnV0IAphbiB1cHN0cmVhbSBicmlk
Z2UgaXMgY29uc3RyYWluaW5nIGl0LCB0aGVuIHRoYXQgbGltaXQgY2FuIGFsc28gYmUgCmRlc2Ny
aWJlZCBlaXRoZXIgYnkgZGVkaWNhdGVkIGZpcm13YXJlIHByb3BlcnRpZXMgKGUuZy4gQUNQSSBf
RE1BKSBvciAKd2l0aCBhIHF1aXJrIGxpa2UgdmlhX25vX2RhYygpLgoKUm9iaW4uCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlvbW11IG1haWxpbmcgbGlz
dAppb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91
bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9pb21tdQ==
