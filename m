Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 254E33D2B4B
	for <lists.iommu@lfdr.de>; Thu, 22 Jul 2021 19:40:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBB0F608AF;
	Thu, 22 Jul 2021 17:40:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UmuK0FEXMrjr; Thu, 22 Jul 2021 17:40:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id D72496063C;
	Thu, 22 Jul 2021 17:40:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A4B0BC001F;
	Thu, 22 Jul 2021 17:40:27 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 13678C000E
 for <iommu@lists.linux-foundation.org>; Thu, 22 Jul 2021 17:40:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EF2254011F
 for <iommu@lists.linux-foundation.org>; Thu, 22 Jul 2021 17:40:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L-u8RWGUbf1e for <iommu@lists.linux-foundation.org>;
 Thu, 22 Jul 2021 17:40:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp2.osuosl.org (Postfix) with ESMTP id F366E400BD
 for <iommu@lists.linux-foundation.org>; Thu, 22 Jul 2021 17:40:24 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 42693106F;
 Thu, 22 Jul 2021 10:40:24 -0700 (PDT)
Received: from [10.57.36.146] (unknown [10.57.36.146])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 120373F694;
 Thu, 22 Jul 2021 10:40:22 -0700 (PDT)
Subject: Re: [bug report] iommu_dma_unmap_sg() is very slow then running IO
 from remote numa node
To: Ming Lei <ming.lei@redhat.com>, John Garry <john.garry@huawei.com>
References: <YOhcOv1oOwm6fco+@T590>
 <ad5bc549-d83f-bee0-9a9f-03a5afd7f3d9@huawei.com> <YPd7IGFZrsTRfUxE@T590>
 <74537f9c-af5f-cd84-60ab-49ca6220310e@huawei.com> <YPfwAN1onpSKoeBj@T590>
 <a2650064-41cf-cb62-7ab4-d14ef1856966@huawei.com> <YPklDMng1hL3bQ+v@T590>
 <9c929985-4fcb-e65d-0265-34c820b770ea@huawei.com> <YPlGOOMSdm6Bcyy/@T590>
 <fc552129-e89d-74ad-9e57-30e3ffe4cf5d@huawei.com> <YPmUoBk9u+tU2rbS@T590>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <0adbe03b-ce26-e4d3-3425-d967bc436ef5@arm.com>
Date: Thu, 22 Jul 2021 18:40:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YPmUoBk9u+tU2rbS@T590>
Content-Language: en-GB
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux-foundation.org,
 Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org
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

T24gMjAyMS0wNy0yMiAxNjo1NCwgTWluZyBMZWkgd3JvdGU6ClsuLi5dCj4+IElmIHlvdSBhcmUg
c3RpbGwga2VlbiB0byBpbnZlc3RpZ2F0ZSBtb3JlLCB0aGVuIGNhbiB0cnkgZWl0aGVyIG9mIHRo
ZXNlOgo+Pgo+PiAtIGFkZCBpb21tdS5zdHJpY3Q9MCB0byB0aGUgY21kbGluZQo+Pgo+PiAtIHVz
ZSBwZXJmIHJlY29yZCthbm5vdGF0ZSB0byBmaW5kIHRoZSBob3RzcG90Cj4+ICAgIC0gRm9yIHRo
aXMgeW91IG5lZWQgdG8gZW5hYmxlIHBzdWVkby1OTUkgd2l0aCAyeCBzdGVwczoKPj4gICAgICBD
T05GSUdfQVJNNjRfUFNFVURPX05NST15IGluIGRlZmNvbmZpZwo+PiAgICAgIEFkZCBpcnFjaGlw
LmdpY3YzX3BzZXVkb19ubWk9MQo+Pgo+PiAgICAgIFNlZSBodHRwczovL2dpdC5rZXJuZWwub3Jn
L3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvdHJlZS9hcmNoL2Fy
bTY0L0tjb25maWcjbjE3NDUKPj4gICAgICBZb3VyIGtlcm5lbCBsb2cgc2hvdWxkIHNob3c6Cj4+
ICAgICAgWyAgICAwLjAwMDAwMF0gR0lDdjM6IFBzZXVkby1OTUlzIGVuYWJsZWQgdXNpbmcgZm9y
Y2VkIElDQ19QTVJfRUwxCj4+IHN5bmNocm9uaXNhdGlvbgo+IAo+IE9LLCB3aWxsIHRyeSB0aGUg
YWJvdmUgdG9tb3Jyb3cuCgpUaGFua3MsIEkgd2FzIGFsc28gZ29pbmcgdG8gc3VnZ2VzdCB0aGUg
bGF0dGVyLCBzaW5jZSBpdCdzIHdoYXQgCmFybV9zbW11X2NtZHFfaXNzdWVfY21kbGlzdCgpIGRv
ZXMgd2l0aCBJUlFzIG1hc2tlZCB0aGF0IHNob3VsZCBiZSBtb3N0IAppbmRpY2F0aXZlIG9mIHdo
ZXJlIHRoZSBzbG93bmVzcyBtb3N0IGxpa2VseSBzdGVtcyBmcm9tLgoKRldJVyBJIHdvdWxkIGV4
cGVjdCBpb21tdS5zdHJpY3Q9MCB0byBnaXZlIGEgcHJvcG9ydGlvbmFsIHJlZHVjdGlvbiBpbiAK
U01NVSBvdmVyaGVhZCBmb3IgYm90aCBjYXNlcyBzaW5jZSBpdCBzaG91bGQgZWZmZWN0aXZlbHkg
bWVhbiBvbmx5IDEvMjU2IAphcyBtYW55IGludmFsaWRhdGlvbnMgYXJlIGlzc3VlZC4KCkNvdWxk
IHlvdSBhbHNvIGNoZWNrIHdoZXRoZXIgdGhlIFNNTVUgcGxhdGZvcm0gZGV2aWNlcyBoYXZlICJu
dW1hX25vZGUiIApwcm9wZXJ0aWVzIGV4cG9zZWQgaW4gc3lzZnMgKGFuZCBpZiBzbyB3aGV0aGVy
IHRoZSB2YWx1ZXMgbG9vayByaWdodCksIAphbmQgc2hhcmUgYWxsIHRoZSBTTU1VIG91dHB1dCBm
cm9tIHRoZSBib290IGxvZz8KCkkgc3RpbGwgc3VzcGVjdCB0aGF0IHRoZSBtb3N0IHNpZ25pZmlj
YW50IGJvdHRsZW5lY2sgaXMgbGlrZWx5IHRvIGJlIApNTUlPIGFjY2VzcyBhY3Jvc3MgY2hpcHMs
IGluY3VycmluZyB0aGUgQ01ML0NDSVggbGF0ZW5jeSB0d2ljZSBmb3IgZXZlcnkgCnNpbmdsZSBy
ZWFkLCBidXQgaXQncyBhbHNvIHBvc3NpYmxlIHRoYXQgdGhlIHBlcmZvcm1hbmNlIG9mIHRoZSBT
TU1VIAppdHNlbGYgY291bGQgYmUgcmVkdWNlZCBpZiBpdHMgTlVNQSBhZmZpbml0eSBpcyBub3Qg
ZGVzY3JpYmVkIGFuZCB3ZSBlbmQgCnVwIGFsbG9jYXRpbmcgc3R1ZmYgbGlrZSBwYWdldGFibGVz
IG9uIHRoZSB3cm9uZyBub2RlIGFzIHdlbGwuCgo+PiBCdXQgbXkgaW1wcmVzc2lvbiBpcyB0aGF0
IHRoaXMgbWF5IGJlIGEgSFcgaW1wbGVtZW50YXRpb24gaXNzdWUsIGNvbnNpZGVyaW5nCj4+IHdl
IGRvbid0IHNlZSBzdWNoIGEgaHVnZSBkcm9wIG9mZiBvbiBvdXIgSFcuCj4gCj4gRXhjZXB0IGZv
ciBtcGVyZS1tdGphZGUsIHdlIHNhdyBiYWQgbnZtZSBwZXJmb3JtYW5jZSBvbiBUaHVuZGVyWDLC
riBDTjk5WFggdG9vLAo+IGJ1dCBJIGRvbid0IGdldCBvbmUgQ045OVhYIHN5c3RlbSB0byBjaGVj
ayBpZiB0aGUgaXNzdWUgaXMgc2FtZSB3aXRoCj4gdGhpcyBvbmUuCgpJIGtub3cgQ2F2aXVtJ3Mg
U01NVSBpbXBsZW1lbnRhdGlvbiBkaWRuJ3Qgc3VwcG9ydCBNU0lzLCBzbyB0aGF0IGNhc2UgCndv
dWxkIHF1aXRlIHBvc3NpYmx5IGxlYW4gdG93YXJkcyB0aGUgTU1JTyBwb2xsaW5nIGFuZ2xlIGFz
IHdlbGwgKGFsYmVpdCAKd2l0aCBhIHZlcnkgZGlmZmVyZW50IGludGVyY29ubmVjdCkuCgpSb2Jp
bi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW9tbXUg
bWFpbGluZyBsaXN0CmlvbW11QGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlz
dHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lvbW11
