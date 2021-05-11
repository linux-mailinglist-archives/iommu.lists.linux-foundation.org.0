Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id EC46937A282
	for <lists.iommu@lfdr.de>; Tue, 11 May 2021 10:50:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62C1040E7E;
	Tue, 11 May 2021 08:50:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uUfYNciEr-1Q; Tue, 11 May 2021 08:50:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45C5840E84;
	Tue, 11 May 2021 08:50:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 08D58C0001;
	Tue, 11 May 2021 08:50:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A5406C0001;
 Tue, 11 May 2021 08:50:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9FE8140E7D;
 Tue, 11 May 2021 08:50:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XbzQaMJ1LDhM; Tue, 11 May 2021 08:50:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D58EE405F8;
 Tue, 11 May 2021 08:50:17 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 1D90C67373; Tue, 11 May 2021 10:50:12 +0200 (CEST)
Date: Tue, 11 May 2021 10:50:11 +0200
From: Christoph Hellwig <hch@lst.de>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH] drm/ttm: use dma_alloc_pages for the page pool
Message-ID: <20210511085011.GA14477@lst.de>
References: <20210511060514.3956745-1-hch@lst.de>
 <20210511060514.3956745-2-hch@lst.de>
 <d2a72848-8273-d0b6-0250-3fe88122246a@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d2a72848-8273-d0b6-0250-3fe88122246a@amd.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: amd-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Roland Scheidegger <sroland@vmware.com>,
 dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, virtualization@lists.linux-foundation.org,
 iommu@lists.linux-foundation.org, Huang Rui <ray.huang@amd.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 nouveau@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Dave Airlie <airlied@redhat.com>, spice-devel@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>, Zack Rusin <zackr@vmware.com>,
 Gerd Hoffmann <kraxel@redhat.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

T24gVHVlLCBNYXkgMTEsIDIwMjEgYXQgMDk6MzU6MjBBTSArMDIwMCwgQ2hyaXN0aWFuIEvDtm5p
ZyB3cm90ZToKPiBXZSBjZXJ0YWlubHkgZ29pbmcgdG8gbmVlZCB0aGUgZHJtX25lZWRfc3dpb3Rs
YigpIGZvciB1c2VycHRyIHN1cHBvcnQgCj4gKHVubGVzcyB3ZSBhZGQgc29tZSBhcHByb2FjaCBm
b3IgZHJpdmVycyB0byBvcHQgb3V0IG9mIHN3aW90bGIpLgoKc3dpb3RsYiB1c2UgaXMgZHJpdmVu
IGJ5IHRocmVlIHRoaW5nczoKCiAxKSBhZGRyZXNzaW5nIGxpbWl0YXRpb25zIG9mIHRoZSBkZXZp
Y2UKIDIpIGFkZHJlc3NpbmcgbGltaXRhdGlvbnMgb2YgdGhlIGludGVyY29ubmVjdAogMykgdmly
dHVhbGl6dGlvbiBtb2RlcyB0aGF0IHJlcXVpcmUgaXQKCm5vdCBzdXJlIGhvdyB0aGUgZHJpdmVy
IGNvdWxkIG9wdCBvdXQuICBXaGF0IGlzIHRoZSBwcm9ibGVtIHdpdGggdXNlcnB0cgpzdXBwb3J0
PwoKPiBUaGVuIHdoaWxlIEkgcmVhbGx5IHdhbnQgdG8gZ2V0IHJpZCBvZiBHRlBfRE1BMzIgYXMg
d2VsbCBJJ20gbm90IDEwMCUgc3VyZSAKPiBpZiB3ZSBjYW4gaGFuZGxlIHRoaXMgd2l0aG91dCB0
aGUgZmxhZy4KCk5vdGUgdGhhdCB0aGlzIGlzIHN0aWxsIHVzaW5nIEdGUF9ETUEzMiB1bmRlcm5l
YXRoIHdoZXJlIHJlcXVpcmVkLApqdXN0IGluIGEgbGF5ZXIgdGhhdCBjYW4gZGVjaWRlIHRoYXQg
0ZVlbnNpYmx5LgoKPiBBbmQgbGFzdCB3ZSBuZWVkIHNvbWV0aGluZyBiZXR0ZXIgdG8gc3RvcmUg
dGhlIERNQSBhZGRyZXNzIGFuZCBvcmRlciB0aGFuIAo+IGFsbG9jYXRpbmcgYSBzZXBhcmF0ZSBt
ZW1vcnkgb2JqZWN0IGZvciBlYWNoIHBhZ2UuCgpZZWFoLiAgSWYgeW91IHVzZSBfX0dGUF9DT01Q
IGZvciB0aGUgYWxsb2NhdGlvbnMgd2UgY2FuIGZpbmQgdGhlIG9yZGVyCmZyb20gdGhlIHBhZ2Ug
aXRzZWxmLCB3aGljaCBtaWdodCBiZSB1c2VmdWwuICBGb3IgNjQtYml0IHBsYXRmb3Jtcwp0aGUg
ZG1hIGFkZHJlc3MgY291bGQgYmUgc3RvcmUgaW4gcGFnZS0+cHJpdmF0ZSwgb3IgZGVwZW5kaW5n
IG9uIGhvdwp0aGUgcGFnZSBnZXRzIHVzZWQgdGhlIGRtYV9hZGRyIGZpZWxkIGluIHN0cnVjdCBw
YWdlIHRoYXQgb3ZlcmxvYWRzCnRoZSBscnUgZmllbGQgYW5kIGlzIHVzZWQgYnkgdGhlIG5ldHdv
cmtpbmcgcGFnZSBwb29sIGNvdWxkIGJlIHVzZWQuCgpNYXliZSB3ZSBjb3VsZCBldmVuIGhhdmUg
YSBjb21tb24gcGFnZSBwb29sIGJldHdlZW4gbmV0IGFuZCBkcm0sIGJ1dApJIGRvbid0IHdhbnQg
dG8gZ28gdGhlcmUgbXlzZWxmLCBub3QgYmVpbmcgYW4gZXhwZXJ0IG9uIGVpdGhlciBzdWJzeXN0
ZW0uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlvbW11
IG1haWxpbmcgbGlzdAppb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xp
c3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby9pb21tdQ==
