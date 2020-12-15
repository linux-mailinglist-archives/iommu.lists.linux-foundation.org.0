Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BDE12DA6B3
	for <lists.iommu@lfdr.de>; Tue, 15 Dec 2020 04:21:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id AD9EF20451;
	Tue, 15 Dec 2020 03:21:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id osZMXySbQmOJ; Tue, 15 Dec 2020 03:21:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id C10D020402;
	Tue, 15 Dec 2020 03:21:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A63C5C013B;
	Tue, 15 Dec 2020 03:21:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0A105C013B
 for <iommu@lists.linux-foundation.org>; Tue, 15 Dec 2020 03:21:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0171E85BE4
 for <iommu@lists.linux-foundation.org>; Tue, 15 Dec 2020 03:21:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UUBqAFW6vjwo for <iommu@lists.linux-foundation.org>;
 Tue, 15 Dec 2020 03:21:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 5F30E858B8
 for <iommu@lists.linux-foundation.org>; Tue, 15 Dec 2020 03:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608002466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IrMpvz55hGybueyoPIQNJHgWjqNF1vFoHRYBb5gRXt8=;
 b=BjAIMSPnqZnpBaBT42O0J+wHA5JwqlKTUFufCVyPbZk0V/kpVxtZp6Ay9wFpKWQ88OnclG
 rXJ8X3VQ4aNP0sxB4OgEA4zyHTLaFHYwC8SkphXwtiFFkUZWu2h6HMGCO/Z6Tj1exTmhpg
 208ZAyp9qM3wUAx66Z4fB35dqsDm31w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-80-R7u_qehVOXem7SoEVA1ssw-1; Mon, 14 Dec 2020 22:21:01 -0500
X-MC-Unique: R7u_qehVOXem7SoEVA1ssw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD2E159;
 Tue, 15 Dec 2020 03:20:58 +0000 (UTC)
Received: from [10.72.13.123] (ovpn-13-123.pek2.redhat.com [10.72.13.123])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E163D5D9DC;
 Tue, 15 Dec 2020 03:20:49 +0000 (UTC)
Subject: Re: swiotlb/virtio: unchecked device dma address and length
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Felicitas Hetzelt <file@sect.tu-berlin.de>, ashish.kalra@amd.com,
 jun.nakajima@intel.com, hch@lst.de
References: <d2ae0b1d-332b-42a1-87bf-7da2b749cac2@sect.tu-berlin.de>
 <20201214214950.GC18103@char.us.oracle.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <c3629a27-3590-1d9f-211b-c0b7be152b32@redhat.com>
Date: Tue, 15 Dec 2020 11:20:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201214214950.GC18103@char.us.oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: "Radev, Martin" <martin.radev@aisec.fraunhofer.de>, david.kaplan@amd.com,
 "Michael S. Tsirkin" <mst@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Robert Buhren <robert@sect.tu-berlin.de>, iommu@lists.linux-foundation.org,
 "Morbitzer, Mathias" <mathias.morbitzer@aisec.fraunhofer.de>
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

Ck9uIDIwMjAvMTIvMTUg5LiK5Y2INTo0OSwgS29ucmFkIFJ6ZXN6dXRlayBXaWxrIHdyb3RlOgo+
IE9uIEZyaSwgRGVjIDExLCAyMDIwIGF0IDA2OjMxOjIxUE0gKzAxMDAsIEZlbGljaXRhcyBIZXR6
ZWx0IHdyb3RlOgo+PiBIZWxsbywKPiBIaSEgUGxlYXNlIHNlZSBiZWxvdyBteSByZXNwb25zZXMu
Cj4KPj4gd2UgaGF2ZSBiZWVuIGFuYWx5emluZyB0aGUgSHlwZXJ2aXNvci1PUyBpbnRlcmZhY2Ug
b2YgTGludXgKPj4gYW5kIGRpc2NvdmVyZWQgYnVncyBpbiB0aGUgc3dpb3RsYi92aXJ0aW8gaW1w
bGVtZW50YXRpb24gdGhhdCBjYW4gYmUKPj4gdHJpZ2dlcmVkIGZyb20gYSBtYWxpY2lvdXMgSHlw
ZXJ2aXNvciAvIHZpcnR1YWwgZGV2aWNlLgo+PiBXaXRoIFNFViwgdGhlIFNXSU9UTEIgaW1wbGVt
ZW50YXRpb24gaXMgZm9yY2VmdWxseSBlbmFibGVkIGFuZCB3b3VsZAo+PiBhbHdheXMgYmUgdXNl
ZC4gVGh1cywgYWxsIHZpcnRpbyBkZXZpY2VzIGFuZCBvdGhlcnMgd291bGQgdXNlIGl0IHVuZGVy
Cj4+IHRoZSBob29kLgo+Pgo+PiBUaGUgcmVhc29uIGZvciBhbmFseXppbmcgdGhpcyBpbnRlcmZh
Y2UgaXMgdGhhdCwgdGVjaG5vbG9naWVzIHN1Y2ggYXMKPj4gSW50ZWwncyBUcnVzdGVkIERvbWFp
biBFeHRlbnNpb25zIFsxXSBhbmQgQU1EJ3MgU2VjdXJlIE5lc3RlZCBQYWdpbmcgWzJdCj4+IGNo
YW5nZSB0aGUgdGhyZWF0IG1vZGVsIGFzc3VtZWQgYnkgdmFyaW91cyBMaW51eCBrZXJuZWwgc3Vi
c3lzdGVtcy4KPj4gVGhlc2UgdGVjaG5vbG9naWVzIHRha2UgdGhlIHByZXNlbmNlIG9mIGEgZnVs
bHkgbWFsaWNpb3VzIGh5cGVydmlzb3IKPj4gaW50byBhY2NvdW50IGFuZCBhaW0gdG8gcHJvdmlk
ZSBwcm90ZWN0aW9uIGZvciB2aXJ0dWFsIG1hY2hpbmVzIGluIHN1Y2gKPj4gYW4gZW52aXJvbm1l
bnQuIFRoZXJlZm9yZSwgYWxsIGlucHV0IHJlY2VpdmVkIGZyb20gdGhlIGh5cGVydmlzb3Igb3Ig
YW4KPj4gZXh0ZXJuYWwgZGV2aWNlIHNob3VsZCBiZSBjYXJlZnVsbHkgdmFsaWRhdGVkLiBOb3Rl
IHRoYXQgdGhlc2UgaXNzdWVzCj4+IGFyZSBvZiBsaXR0bGUgKG9yIG5vKSByZWxldmFuY2UgaW4g
YSAibm9ybWFsIiB2aXJ0dWFsaXphdGlvbiBzZXR1cCwKPj4gbmV2ZXJ0aGVsZXNzIHdlIGJlbGll
dmUgdGhhdCBpdCBpcyByZXF1aXJlZCB0byBmaXggdGhlbSBpZiBURFggb3IgU05QIGlzCj4+IHVz
ZWQuCj4+Cj4+IFdlIGFyZSBoYXBweSB0byBwcm92aWRlIG1vcmUgaW5mb3JtYXRpb24gaWYgbmVl
ZGVkIQo+Pgo+PiBbMV0KPj4gaHR0cHM6Ly9zb2Z0d2FyZS5pbnRlbC5jb20vY29udGVudC93d3cv
dXMvZW4vZGV2ZWxvcC9hcnRpY2xlcy9pbnRlbC10cnVzdC1kb21haW4tZXh0ZW5zaW9ucy5odG1s
Cj4+Cj4+IFsyXWh0dHBzOi8vd3d3LmFtZC5jb20vZW4vcHJvY2Vzc29ycy9hbWQtc2VjdXJlLWVu
Y3J5cHRlZC12aXJ0dWFsaXphdGlvbgo+Pgo+PiBCdWc6Cj4+IE9PQiBtZW1vcnkgd3JpdGUuCj4+
IGRtYV91bm1hcF9zaW5nbGUgLT4gc3dpb3RsYl90YmxfdW5tYXBfc2luZ2xlIGlzIGludm9rZWQg
d2l0aCBkbWFfYWRkcgo+PiBhbmQgbGVuZ3RoIHBhcmFtZXRlcnMgdGhhdCBhcmUgdW5kZXIgY29u
dHJvbCBvZiB0aGUgZGV2aWNlLgo+PiBUaGlzIGhhcHBlbnMgZS5nLiBpbiB2aXJ0aW9fcmluZzoK
Pj4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjUuMTAtcmM3L3NvdXJjZS9kcml2
ZXJzL3ZpcnRpby92aXJ0aW9fcmluZy5jI0wzNzgKPiBIZXlhIQo+Cj4gVGhhbmsgeW91IGZvciBw
b2ludGluZyB0aGlzIG91dCEgSSd2ZSBhIGNvdXBsZSBvZiBxdWVzdGlvbnMgYW5kIGhvcGUgeW91
IGNhbgo+IGhlbHAgbWUgb3V0IHdpdGggdGhlbS4KPgo+IEFsc28gQ0MtaW5nIEFNRCAvIFREWCBm
b2xrcy4KPj4gVGhpcyByYWlzZXMgdHdvIGlzc3VlczoKPj4gMSkgc3dpb3RsYl90bGJfdW5tYXBf
c2luZ2xlIGZhaWxzIHRvIGNoZWNrIHdoZXRoZXIgdGhlIGluZGV4IGdlbmVyYXRlZAo+PiBmcm9t
IHRoZSBkbWFfYWRkciBpcyBpbiByYW5nZSBvZiB0aGUgaW9fdGxiX29yaWdfYWRkciBhcnJheS4K
PiBUaGF0IGlzIGZhaXJseSBzaW1wbGUgdG8gaW1wbGVtZW50IEkgd291bGQgdGhpbmsuIFRoYXQg
aXMgaXQgY2FuIGNoZWNrCj4gdGhhdCB0aGUgZG1hX2FkZHIgaXMgZnJvbSB0aGUgUEEgaW4gdGhl
IGlvX3RsYiBwb29sIHdoZW4gU1dJT1RMQj1mb3JjZQo+IGlzIHVzZWQuCgoKSSdtIG5vdCBzdXJl
IHRoaXMgY2FuIGZpeCBhbGwgdGhlIGNhc2VzLiBJdCBsb29rcyB0byBtZSB3ZSBzaG91bGQgbWFw
IApkZXNjcmlwdG9yIGNvaGVyZW50IGJ1dCByZWFkb25seSAod2hpY2ggaXMgbm90IHN1cHBvcnRl
ZCBieSBjdXJyZW50IERNQSAKQVBJKS4KCk90aGVyd2lzZSwgZGV2aWNlIGNhbiBtb2RpZnkgdGhl
IGRlc2NbaV0uYWRkci9kZXNjW2ldLmxlbiBhdCBhbnkgdGltZSB0byAKcHJldGVuZCBhIHZhbGlk
IG1hcHBpbmcuCgpUaGFua3MKCgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwppb21tdSBtYWlsaW5nIGxpc3QKaW9tbXVAbGlzdHMubGludXgtZm91bmRh
dGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGlu
Zm8vaW9tbXU=
