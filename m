Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 2490226BA42
	for <lists.iommu@lfdr.de>; Wed, 16 Sep 2020 04:34:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 8B960230FE;
	Wed, 16 Sep 2020 02:34:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TU-9DRAmt5Fl; Wed, 16 Sep 2020 02:34:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id DE8C9230A4;
	Wed, 16 Sep 2020 02:34:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C8972C0891;
	Wed, 16 Sep 2020 02:34:25 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3C9BBC0051
 for <iommu@lists.linux-foundation.org>; Wed, 16 Sep 2020 02:34:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2A23686CD2
 for <iommu@lists.linux-foundation.org>; Wed, 16 Sep 2020 02:34:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pwrfVggvyEbh for <iommu@lists.linux-foundation.org>;
 Wed, 16 Sep 2020 02:34:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 240E886CCE
 for <iommu@lists.linux-foundation.org>; Wed, 16 Sep 2020 02:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600223661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qnumBkA+KwFilA4RJOFxl4BV5Ql5BJOBeoDcSO1RlRY=;
 b=WrpMBOJHHKF23Ezu+/3hTzSHBhROAyBoKTYNGYc00BJfjCILsCjhlYDEMME+RU279nFLUn
 ecN2H9sKjCfsE7E7Ww3OD+Ymu5N66FABmh98S1PRcvkc4Mqw85MWQs00xsDtIlFQopcQOI
 udC9DCQ5wmIUkUL9SNR2dqN/Xb/K6FM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-p9uQ44heN9OKqanwlBSB6w-1; Tue, 15 Sep 2020 22:34:20 -0400
X-MC-Unique: p9uQ44heN9OKqanwlBSB6w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA4241084C80;
 Wed, 16 Sep 2020 02:34:17 +0000 (UTC)
Received: from [10.72.13.186] (ovpn-13-186.pek2.redhat.com [10.72.13.186])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A2821C4;
 Wed, 16 Sep 2020 02:33:56 +0000 (UTC)
Subject: Re: [PATCH v7 00/16] vfio: expose virtual Shared Virtual Addressing
 to VMs
To: "Raj, Ashok" <ashok.raj@intel.com>, Jason Gunthorpe <jgg@nvidia.com>
References: <20200914162247.GA63399@otc-nc-03>
 <20200914163354.GG904879@nvidia.com> <20200914105857.3f88a271@x1.home>
 <20200914174121.GI904879@nvidia.com> <20200914122328.0a262a7b@x1.home>
 <20200914190057.GM904879@nvidia.com> <20200914224438.GA65940@otc-nc-03>
 <20200915113341.GW904879@nvidia.com> <20200915181154.GA70770@otc-nc-03>
 <20200915184510.GB1573713@nvidia.com> <20200915192632.GA71024@otc-nc-03>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <9e865ab2-9ff9-8af4-7051-96a42f270f06@redhat.com>
Date: Wed, 16 Sep 2020 10:33:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200915192632.GA71024@otc-nc-03>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, kevin.tian@intel.com,
 kvm@vger.kernel.org, iommu@lists.linux-foundation.org, stefanha@gmail.com,
 "Michael S. Tsirkin" <mst@redhat.com>, yi.y.sun@intel.com,
 Alex Williamson <alex.williamson@redhat.com>,
 Jacon Jun Pan <jacob.jun.pan@intel.com>, hao.wu@intel.com,
 jun.j.tian@intel.com
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

Ck9uIDIwMjAvOS8xNiDkuIrljYgzOjI2LCBSYWosIEFzaG9rIHdyb3RlOgo+Pj4gSUlVQywgeW91
IGFyZSBhc2tpbmcgdGhhdCBwYXJ0IG9mIHRoZSBpbnRlcmZhY2UgdG8gbW92ZSB0byBhIEFQSSBp
bnRlcmZhY2UKPj4+IHRoYXQgcG90ZW50aWFsbHkgdGhlIG5ldyAvZGV2L3N2YSBhbmQgVkZJTyBj
b3VsZCBzaGFyZT8gSSB0aGluayB0aGUgQVBJJ3MKPj4+IGZvciBQQVNJRCBtYW5hZ2VtZW50IHRo
ZW1zZWx2ZXMgYXJlIGdlbmVyaWMgKEplYW4ncyBwYXRjaHNldCArIEphY29iJ3MKPj4+IGlvYXNp
ZCBzZXQgbWFuYWdlbWVudCkuCj4+IFllcywgdGhlIGluIGtlcm5lbCBBUElzIGFyZSBwcmV0dHkg
Z2VuZXJpYyBub3csIGFuZCBjYW4gYmUgdXNlZCBieQo+PiBtYW55IHR5cGVzIG9mIGRyaXZlcnMu
Cj4gR29vZCwgc28gdGhlcmUgaXMgbm8gbmV3IHJlcXVpcmVtZW50cyBoZXJlIEkgc3VwcG9zZS4K
CgpUaGUgcmVxdWlyZW1lbnQgaXMgbm90IGZvciBpbi1rZXJuZWwgQVBJcyBidXQgYSBnZW5lcmlj
IHVBUElzLgoKCj4+IEFzIEphc29uVyBraWNrZWQgdGhpcyBvZmYsIFZEUEEgd2lsbCBuZWVkIGFs
bCB0aGlzIGlkZW50aWNhbCBzdHVmZgo+PiB0b28uIFdlIGFscmVhZHkga25vdyB0aGlzLCBhbmQg
SSB0aGluayBJbnRlbCBWRFBBIEhXIHdpbGwgbmVlZCBpdCwgc28KPj4gaXQgc2hvdWxkIGNvbmNl
cm4geW91IHRvbzopCj4gVGhpcyBpcyBvbmUgb2YgdGhvc2UgdGhpbmdzIHRoYXQgSSB3b3VsZCBk
aXNhZ3JlZSBhbmQgY29tbWl0IDotKS4uCj4KPj4gQSBQQVNJRCB2SU9NTVUgc29sdXRpb24gc2hh
cmFibGUgd2l0aCBWRFBBIGFuZCBWRklPLCBiYXNlZCBvbiBhIFBBU0lECj4+IGNvbnRyb2wgY2hh
ciBkZXYgKGVnIC9kZXYvc3ZhLCBvciBtYXliZSAvZGV2L2lvbW11KSBzZWVtcyBsaWtlIGEKPj4g
cmVhc29uYWJsZSBzdGFydGluZyBwb2ludCBmb3IgZGlzY3Vzc2lvbi4KPiBMb29rcyBsaWtlIG5v
dyB3ZSBhcmUgZ2V0dGluZyBjbG9zZXIgdG8gd2hhdCB3ZSBuZWVkLjotKQo+Cj4gR2l2ZW4gdGhh
dCBQQVNJRCBhcGkncyBhcmUgZ2VuZXJhbCBwdXJwb3NlIHRvZGF5IGFuZCBhbnkgZHJpdmVyIGNh
biB1c2UgaXQKPiB0byB0YWtlIGFkdmFudGFnZS4gVkZJTyBmb3J0dW5hdGVseSBvciB1bmZvcnR1
bmF0ZWx5IGhhcyB0aGUgSU9NTVUgdGhpbmdzCj4gYWJzdHJhY3RlZC4gSSBzdXBwb3NlIHRoYXQg
c3VwcG9ydCBpcyBhbHNvIG1vc3RseSBidWlsdCBvbiB0b3Agb2YgdGhlCj4gZ2VuZXJpYyBpb21t
dSogYXBpIGFic3RyYWN0aW9ucyBpbiBhIHZlbmRvciBuZXV0cmFsIHdheT8KPgo+IEknbSBzdGls
bCBsb3N0IG9uIHdoYXQgaXMgbWlzc2luZyB0aGF0IHZEUEEgY2FuJ3QgYnVpbGQgb24gdG9wIG9m
IHdoYXQgaXMKPiBhdmFpbGFibGU/CgoKRm9yIHN1cmUgaXQgY2FuLCBidXQgd2UgbWF5IGVuZCB1
cCBkdXBsaWNhdGVkIChvciBzaW1pbGFyKSB1QVBJcyB3aGljaCAKaXMgYmFkLgoKVGhhbmtzCgoK
Pgo+IENoZWVycywKPiBBc2hvawo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwppb21tdSBtYWlsaW5nIGxpc3QKaW9tbXVAbGlzdHMubGludXgtZm91bmRh
dGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGlu
Zm8vaW9tbXU=
