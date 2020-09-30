Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B88EB27E280
	for <lists.iommu@lfdr.de>; Wed, 30 Sep 2020 09:22:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6EA5A85F4C;
	Wed, 30 Sep 2020 07:22:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pOL9EN-2hSPo; Wed, 30 Sep 2020 07:22:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1F1D585F4B;
	Wed, 30 Sep 2020 07:22:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0A5D3C016F;
	Wed, 30 Sep 2020 07:22:24 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E6E8CC0051
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 07:22:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id E1B0786840
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 07:22:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w-0KIYgoyAVH for <iommu@lists.linux-foundation.org>;
 Wed, 30 Sep 2020 07:22:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5F11684D89
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 07:22:22 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id s14so503763pju.1
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 00:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=yJyPv9TfvoTiNiepUCS1moee1qgA1MUCDqAQ76iLRGw=;
 b=dIjQ4Kq7OP6C1q55KiX7llzOLRIxLxLiAEZUJPtcvKr22oEfblNhrGHtxeM8XIyCOI
 /W/jTi0/dVSNlDsYDUxCqyCzw0wIbPPIoOJWVZHcnie4W616Ent7T6zODTqDg4uABts3
 hi4fibufYdX0d39thb8ihr7pTCHR/Dhpy1nhM0TrWsDYMdy+FTasX9wI62aVQ/AnQYYp
 pUnD1gPZir2hrCQi/uqU7HKaMUy8FwlN03RAm6Ik1W8MPPt8lyjBlvVE7Od59AX3Y7Lr
 RuEK7b1wgvRayFlXhpzLopy50CZF5YLeVwJmAs68gQYgRH/Lmg82pi3Vhn9zwF5h3ImP
 hfNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=yJyPv9TfvoTiNiepUCS1moee1qgA1MUCDqAQ76iLRGw=;
 b=Hagd6gyRAetoPa+oqs97qUocK+neM1kTyizw0rPcAtRrDrTHSwOTGV1BZnYnmgIvnN
 oMYaMRcmvOtnDMxiFwBXDnRM3yzkPrLlO1vsnwlsfI+eY1DiPqTBPaSsbeE/qvezt0ZA
 DeMEbA6/xzPD/khSuIzBcMoqGVdOCgaQNuq4OB1M67VandDe785qtbKwXc0o55+5L0uw
 A11uplANgc7PzB5sl3DYODS0qoKT3+i0riKHG5jzBVrKwm0LB1MzofqpUDMl23/6jSTV
 SIesCcfFtRvMHmEMfOrRAAwGgIVNcNTrUnH211+7Rw/Ax8EHe7kNd3jR8OL0/YpVHhaS
 dXeg==
X-Gm-Message-State: AOAM531mijcJ8gsOvn8C3OsD2eM9p3Kv5gBSgfITG4uXJh8dhWlY/ccc
 0WwZRKTvAeOTEwbTb/f969k=
X-Google-Smtp-Source: ABdhPJz/rnWA9bYT3PPtMlpoljxk/a7LibergtvDqyjwYz/Z7mihUyup7d6kfRH6Q8SIbLPsHcf17A==
X-Received: by 2002:a17:90a:c17:: with SMTP id
 23mr1347882pjs.127.1601450541995; 
 Wed, 30 Sep 2020 00:22:21 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id v65sm939141pgv.21.2020.09.30.00.22.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 30 Sep 2020 00:22:21 -0700 (PDT)
Date: Wed, 30 Sep 2020 00:16:50 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 3/3] iommu/tegra-smmu: Add PCI support
Message-ID: <20200930071650.GB13876@Asurada-Nvidia>
References: <20200930003013.31289-1-nicoleotsuka@gmail.com>
 <20200930003013.31289-4-nicoleotsuka@gmail.com>
 <f07d4fcc-ee19-874b-c542-0679660c3549@gmail.com>
 <20200930052952.GB31821@Asurada-Nvidia>
 <96e71d38-5888-5b21-f0e1-9e6def50484e@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <96e71d38-5888-5b21-f0e1-9e6def50484e@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 krzk@kernel.org, jonathanh@nvidia.com, thierry.reding@gmail.com,
 linux-tegra@vger.kernel.org
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

T24gV2VkLCBTZXAgMzAsIDIwMjAgYXQgMDg6NTg6NTBBTSArMDMwMCwgRG1pdHJ5IE9zaXBlbmtv
IHdyb3RlOgo+IDMwLjA5LjIwMjAgMDg6MjksIE5pY29saW4gQ2hlbiDQv9C40YjQtdGCOgo+ID4g
SGkgRG1pdHJ5LAo+ID4gCj4gPiBPbiBXZWQsIFNlcCAzMCwgMjAyMCBhdCAwODoxMDowN0FNICsw
MzAwLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4gPj4gMzAuMDkuMjAyMCAwMzozMCwgTmljb2xp
biBDaGVuINC/0LjRiNC10YI6Cj4gPj4+IC0JZ3JvdXAtPmdyb3VwID0gaW9tbXVfZ3JvdXBfYWxs
b2MoKTsKPiA+Pj4gKwlncm91cC0+Z3JvdXAgPSBwY2kgPyBwY2lfZGV2aWNlX2dyb3VwKGRldikg
OiBpb21tdV9ncm91cF9hbGxvYygpOwo+ID4+Cj4gPj4gVGhpcyB3aWxsIGJlIG5pY2VyIHRvIHdy
aXRlIGFzOgo+ID4+Cj4gPj4gaWYgKGRldl9pc19wY2koZGV2KSkKPiA+PiAgICAgZ3JvdXAtPmdy
b3VwID0gcGNpX2RldmljZV9ncm91cChkZXYpOwo+ID4+IGVsc2UKPiA+PiAgICAgZ3JvdXAtPmdy
b3VwID0gZ2VuZXJpY19kZXZpY2VfZ3JvdXAoZGV2KTsKPiA+IAo+ID4gV2h5IGlzIHRoYXQgbmlj
ZXI/IEkgZG9uJ3QgZmVlbCBtaW5lIGlzIGhhcmQgdG8gcmVhZCBhdCBhbGwuLi4KPiA+IAo+IAo+
IFByZXZpb3VzbHkgeW91IHNhaWQgdGhhdCB5b3UncmUgZ29pbmcgdG8gYWRkIFVTQiBzdXBwb3J0
LCBzbyBJIGFzc3VtZQo+IHRoZXJlIHdpbGwgYmUgc29tZXRoaW5nIGFib3V0IFVTQi4KCkkgd2Fz
IGhvcGluZyB0aGF0IGl0J2Qgd29yayBmb3IgVVNCLiBZZXQgVVNCIGRvZXNuJ3Qgc2VlbSB0byBo
YXZlCmFuIGRpZmZlcmVudCBmdW5jdGlvbiBmb3IgZGV2aWNlX2dyb3VwKCkuCgo+IEl0J3MgYWxz
byBhIGtpbmRhIGNvbW1vbiBzdHlsZSB0aGF0IG1ham9yaXR5IG9mIFRlZ3JhIGRyaXZlcnMgdXNl
IGluCj4gdXBzdHJlYW0ga2VybmVsLiBCdXQgeW91cnMgdmFyaWFudCBpcyBnb29kIHRvbyBpZiB0
aGVyZSB3b24ndCBiZSBhIG5lZWQKPiB0byBjaGFuZ2UgaXQgbGF0ZXIgb24uCgpPa2F5Li5JJ2xs
IHVzZSB5b3VycyB0aGVuLgoKVGhhbmtzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmlvbW11IG1haWxpbmcgbGlzdAppb21tdUBsaXN0cy5saW51eC1mb3Vu
ZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0
aW5mby9pb21tdQ==
