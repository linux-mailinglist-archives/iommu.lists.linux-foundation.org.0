Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A2A252957
	for <lists.iommu@lfdr.de>; Wed, 26 Aug 2020 10:40:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 67E0E86936;
	Wed, 26 Aug 2020 08:40:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9jDxqBch5BPW; Wed, 26 Aug 2020 08:40:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4B41A86204;
	Wed, 26 Aug 2020 08:40:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2C1D1C0051;
	Wed, 26 Aug 2020 08:40:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1D47BC0051
 for <iommu@lists.linux-foundation.org>; Wed, 26 Aug 2020 08:40:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id F4102868E4
 for <iommu@lists.linux-foundation.org>; Wed, 26 Aug 2020 08:40:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 56Gow5_n2rNs for <iommu@lists.linux-foundation.org>;
 Wed, 26 Aug 2020 08:40:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 86EA38610F
 for <iommu@lists.linux-foundation.org>; Wed, 26 Aug 2020 08:40:25 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id o22so798723qtt.13
 for <iommu@lists.linux-foundation.org>; Wed, 26 Aug 2020 01:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=zMOE7BVmPyRTv2jz4mqPIGALZmc5cotG47cZLpXd7P0=;
 b=ZaSYnvQy0bZisuDNUS64pc52zd3LStKE6fxdhLmMutAsJpcLtr3O7vWkQ19sGAlveC
 BBOOuFfzOgi1axGeSq9N/yrlUBHzw9kVBY0Zd0ZulXw0csdcWbLp+Oq77HCmgZZXsMxM
 vkVFH+blEU1Q/nIWUCEkVlDTWPGMOOZqHzSn5mU6HYechdmff1rnM1oZJOJLNJX73OJU
 FkU7sslh11sccyp9/XxvpalpzGcjcHUHFzqNTyABV6Yhvs/owq9++Zczca6uuqR6saMU
 jQBkKMUJBtXXfb3e0ZcK4x4l5geDFMLwxqx+y6X2By/HFKUPuNhLbX2i6N2ylwVm0YCQ
 +taw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=zMOE7BVmPyRTv2jz4mqPIGALZmc5cotG47cZLpXd7P0=;
 b=igUcXd9M30kDbjCteQLQ2L1jCm2ZryTIp0RAXg2lAWctjq1v33wF2oyVpFxUXKCOYU
 0isoNvBRqPlwsTIWpluvLhRxti2AC6Yk2q8zAc/LGSF1guo+i3MLie+lpYqFEWY/hQnq
 LkmPgvOgm9stEzQReVJehrBQ472Sco0Ff7g9ryB0T4goFKOqe/Bb3/LM8q14lasYDy3+
 6CjJJNnVpNdbblDzbvEC2Oo6rEV5BPE64Yu9IAQI+9OLMMDvPVm3+JL7uFNNveMR4154
 8LcmsZXIRWLVXpASWPPh7m9/xpr66WaDGZd4VnTzwS+iUZTLFI8Ty3+g/Qq2Nogzzyrn
 qB/A==
X-Gm-Message-State: AOAM530UHhLSRHVMS+TrRHYVPOCYykpo6gZi7HoFA9zF8WvQNmU086sc
 qAULtFPYkxj5Sy6J55GMENw=
X-Google-Smtp-Source: ABdhPJz7C4WtYCX7DFVDZ9wXqDcxQZTjOJS5RkidUejP7+S68XGumDHrfNLnPq5K4GdTGkEpaMpliQ==
X-Received: by 2002:ac8:5d43:: with SMTP id g3mr4770683qtx.369.1598431224464; 
 Wed, 26 Aug 2020 01:40:24 -0700 (PDT)
Received: from auth1-smtp.messagingengine.com (auth1-smtp.messagingengine.com.
 [66.111.4.227])
 by smtp.gmail.com with ESMTPSA id y46sm1470153qth.78.2020.08.26.01.40.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 26 Aug 2020 01:40:23 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailauth.nyi.internal (Postfix) with ESMTP id A347427C0054;
 Wed, 26 Aug 2020 04:40:22 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Wed, 26 Aug 2020 04:40:22 -0400
X-ME-Sender: <xms:9R9GX2xKCIeJJilVotELTMVRdOdEtU0GVimu1XaSTnQMyQ2q2QZSNg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedruddvvddgtdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtugfgjgesthekredttddtjeenucfhrhhomhepuehoqhhu
 nhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrg
 htthgvrhhnpefhteehtdfhhfduiedvueegvdfgveehvdehueefgedtffehgfffgffgtddt
 gfetjeenucffohhmrghinhepihhorghpihgtrdhpihhnnecukfhppeehvddrudehhedrud
 duuddrjedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
 mhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghe
 dtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhes
 fhhigihmvgdrnhgrmhgv
X-ME-Proxy: <xmx:9R9GXyTU6nzfcRktziV4XRtRPEiLJ9JN-4rgRw0VHw7cAuHIJQguag>
 <xmx:9R9GX4UDJesbN8TYSy0lvivr41ncAik1fvQoKEIfcGNtV5vLtU_I0A>
 <xmx:9R9GX8hpaznz7Pz2KTJ0IZWUwzUA3IckfIUnFyOT0BvfD8HlnFrd5Q>
 <xmx:9h9GX4uHBZvzMVvlKIVX5qICQjtuLHpMLqq45SzvFf5kxurzdPDIXVZy3xk>
Received: from localhost (unknown [52.155.111.71])
 by mail.messagingengine.com (Postfix) with ESMTPA id D824830600A9;
 Wed, 26 Aug 2020 04:40:20 -0400 (EDT)
Date: Wed, 26 Aug 2020 16:40:19 +0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch RFC 10/38] x86/ioapic: Consolidate IOAPIC allocation
Message-ID: <20200826084019.GA6174@debian-boqun.qqnc3lrjykvubdpftowmye0fmh.lx.internal.cloudapp.net>
References: <20200821002424.119492231@linutronix.de>
 <20200821002946.297823391@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200821002946.297823391@linutronix.de>
Cc: Dimitri Sivanich <sivanich@hpe.com>, linux-hyperv@vger.kernel.org,
 Steve Wahl <steve.wahl@hpe.com>, linux-pci@vger.kernel.org,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Dan Williams <dan.j.williams@intel.com>, Wei Liu <wei.liu@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, Baolu Lu <baolu.lu@intel.com>,
 Marc Zyngier <maz@kernel.org>, x86@kernel.org,
 Jason Gunthorpe <jgg@mellanox.com>, Megha Dey <megha.dey@intel.com>,
 xen-devel@lists.xenproject.org, Kevin Tian <kevin.tian@intel.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Dave Jiang <dave.jiang@intel.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Jon Derrick <jonathan.derrick@intel.com>, Juergen Gross <jgross@suse.com>,
 Russ Anderson <rja@hpe.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 Jacob Pan <jacob.jun.pan@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>
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

SGkgVGhvbWFzLAoKSSBoaXQgYSBjb21waWxlciBlcnJvciB3aGlsZSBJIHdhcyB0cnlpbmcgdG8g
Y29tcGlsZSB0aGlzIHBhdGNoc2V0OgoKYXJjaC94ODYva2VybmVsL2RldmljZXRyZWUuYzogSW4g
ZnVuY3Rpb24g4oCYZHRfaXJxZG9tYWluX2FsbG9j4oCZOgphcmNoL3g4Ni9rZXJuZWwvZGV2aWNl
dHJlZS5jOjIzMjo2OiBlcnJvcjog4oCYc3RydWN0IGlycV9hbGxvY19pbmZv4oCZIGhhcyBubyBt
ZW1iZXIgbmFtZWQg4oCYaW9hcGljX2lk4oCZOyBkaWQgeW91IG1lYW4g4oCYaW9hcGlj4oCZPwog
IDIzMiB8ICB0bXAuaW9hcGljX2lkID0gbXBjX2lvYXBpY19pZChtcF9pcnFkb21haW5faW9hcGlj
X2lkeChkb21haW4pKTsKICAgICAgfCAgICAgIF5+fn5+fn5+fgogICAgICB8ICAgICAgaW9hcGlj
CmFyY2gveDg2L2tlcm5lbC9kZXZpY2V0cmVlLmM6MjMzOjY6IGVycm9yOiDigJhzdHJ1Y3QgaXJx
X2FsbG9jX2luZm/igJkgaGFzIG5vIG1lbWJlciBuYW1lZCDigJhpb2FwaWNfcGlu4oCZOyBkaWQg
eW91IG1lYW4g4oCYaW9hcGlj4oCZPwogIDIzMyB8ICB0bXAuaW9hcGljX3BpbiA9IGZ3c3BlYy0+
cGFyYW1bMF0KICAgICAgfCAgICAgIF5+fn5+fn5+fn4KICAgICAgfCAgICAgIGlvYXBpYwoKd2l0
aCBDT05GSUdfT0Y9eS4gSUlVQywgdGhlIGZvbGxvd2luZyBjaGFuZ2VzIGFyZSBuZWVkZWQgdG8g
Zm9sZCBpbnRvCnRoaXMgcGF0Y2guIChBdCBsZWFzdCBJIGNhbiBjb250aW51ZSB0byBjb21waWxl
IHRoZSBrZXJuZWwgd2l0aCB0aGlzCmNoYW5nZSkKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rZXJu
ZWwvZGV2aWNldHJlZS5jIGIvYXJjaC94ODYva2VybmVsL2RldmljZXRyZWUuYwppbmRleCBhMGU4
ZmM3ZDg1ZjEuLmRkZmZkODBmNWM1MiAxMDA2NDQKLS0tIGEvYXJjaC94ODYva2VybmVsL2Rldmlj
ZXRyZWUuYworKysgYi9hcmNoL3g4Ni9rZXJuZWwvZGV2aWNldHJlZS5jCkBAIC0yMjksOCArMjI5
LDggQEAgc3RhdGljIGludCBkdF9pcnFkb21haW5fYWxsb2Moc3RydWN0IGlycV9kb21haW4gKmRv
bWFpbiwgdW5zaWduZWQgaW50IHZpcnEsCiAKIAlpdCA9ICZvZl9pb2FwaWNfdHlwZVt0eXBlX2lu
ZGV4XTsKIAlpb2FwaWNfc2V0X2FsbG9jX2F0dHIoJnRtcCwgTlVNQV9OT19OT0RFLCBpdC0+dHJp
Z2dlciwgaXQtPnBvbGFyaXR5KTsKLQl0bXAuaW9hcGljX2lkID0gbXBjX2lvYXBpY19pZChtcF9p
cnFkb21haW5faW9hcGljX2lkeChkb21haW4pKTsKLQl0bXAuaW9hcGljX3BpbiA9IGZ3c3BlYy0+
cGFyYW1bMF07CisJdG1wLmRldmlkID0gbXBjX2lvYXBpY19pZChtcF9pcnFkb21haW5faW9hcGlj
X2lkeChkb21haW4pKTsKKwl0bXAuaW9hcGljLnBpbiA9IGZ3c3BlYy0+cGFyYW1bMF07CiAKIAly
ZXR1cm4gbXBfaXJxZG9tYWluX2FsbG9jKGRvbWFpbiwgdmlycSwgbnJfaXJxcywgJnRtcCk7CiB9
CgpSZWdhcmRzLApCb3F1bgoKT24gRnJpLCBBdWcgMjEsIDIwMjAgYXQgMDI6MjQ6MzRBTSArMDIw
MCwgVGhvbWFzIEdsZWl4bmVyIHdyb3RlOgo+IE1vdmUgdGhlIElPQVBJQyBzcGVjaWZpYyBmaWVs
ZHMgaW50byB0aGVpciBvd24gc3RydWN0IGFuZCByZXVzZSB0aGUgY29tbW9uCj4gZGV2aWQuIEdl
dCByaWQgb2YgdGhlICNpZmRlZmZlcnkgYXMgaXQgZG9lcyBub3QgbWF0dGVyIGF0IGFsbCB3aGV0
aGVyIHRoZQo+IGFsbG9jIGluZm8gaXMgYSBjb3VwbGUgb2YgYnl0ZXMgbG9uZ2VyIG9yIG5vdC4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5kZT4K
PiBDYzogV2VpIExpdSA8d2VpLmxpdUBrZXJuZWwub3JnPgo+IENjOiAiSy4gWS4gU3Jpbml2YXNh
biIgPGt5c0BtaWNyb3NvZnQuY29tPgo+IENjOiBTdGVwaGVuIEhlbW1pbmdlciA8c3RoZW1taW5A
bWljcm9zb2Z0LmNvbT4KPiBDYzogSm9lcmcgUm9lZGVsIDxqb3JvQDhieXRlcy5vcmc+Cj4gQ2M6
IGxpbnV4LWh5cGVydkB2Z2VyLmtlcm5lbC5vcmcKPiBDYzogaW9tbXVAbGlzdHMubGludXgtZm91
bmRhdGlvbi5vcmcKPiBDYzogSGFpeWFuZyBaaGFuZyA8aGFpeWFuZ3pAbWljcm9zb2Z0LmNvbT4K
PiBDYzogSm9uIERlcnJpY2sgPGpvbmF0aGFuLmRlcnJpY2tAaW50ZWwuY29tPgo+IENjOiBMdSBC
YW9sdSA8YmFvbHUubHVAbGludXguaW50ZWwuY29tPgo+IC0tLQo+ICBhcmNoL3g4Ni9pbmNsdWRl
L2FzbS9od19pcnEuaCAgICAgICB8ICAgMjMgKysrKysrLS0tLS0KPiAgYXJjaC94ODYva2VybmVs
L2FwaWMvaW9fYXBpYy5jICAgICAgfCAgIDcwICsrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0t
LS0tLS0tLQo+ICBkcml2ZXJzL2lvbW11L2FtZC9pb21tdS5jICAgICAgICAgICB8ICAgMTQgKysr
LS0tLQo+ICBkcml2ZXJzL2lvbW11L2h5cGVydi1pb21tdS5jICAgICAgICB8ICAgIDIgLQo+ICBk
cml2ZXJzL2lvbW11L2ludGVsL2lycV9yZW1hcHBpbmcuYyB8ICAgMTggKysrKy0tLS0tCj4gIDUg
ZmlsZXMgY2hhbmdlZCwgNjQgaW5zZXJ0aW9ucygrKSwgNjMgZGVsZXRpb25zKC0pCj4gCj4gLS0t
IGEvYXJjaC94ODYvaW5jbHVkZS9hc20vaHdfaXJxLmgKPiArKysgYi9hcmNoL3g4Ni9pbmNsdWRl
L2FzbS9od19pcnEuaAo+IEBAIC00NCw2ICs0NCwxNSBAQCBlbnVtIGlycV9hbGxvY190eXBlIHsK
PiAgCVg4Nl9JUlFfQUxMT0NfVFlQRV9IUEVUX0dFVF9QQVJFTlQsCj4gIH07Cj4gIAo+ICtzdHJ1
Y3QgaW9hcGljX2FsbG9jX2luZm8gewo+ICsJaW50CQkJCXBpbjsKPiArCWludAkJCQlub2RlOwo+
ICsJdTMyCQkJCXRyaWdnZXIgOiAxOwo+ICsJdTMyCQkJCXBvbGFyaXR5IDogMTsKPiArCXUzMgkJ
CQl2YWxpZCA6IDE7Cj4gKwlzdHJ1Y3QgSU9fQVBJQ19yb3V0ZV9lbnRyeQkqZW50cnk7Cj4gK307
Cj4gKwo+ICAvKioKPiAgICogaXJxX2FsbG9jX2luZm8gLSBYODYgc3BlY2lmaWMgaW50ZXJydXB0
IGFsbG9jYXRpb24gaW5mbwo+ICAgKiBAdHlwZToJWDg2IHNwZWNpZmljIGFsbG9jYXRpb24gdHlw
ZQo+IEBAIC01Myw2ICs2Miw4IEBAIGVudW0gaXJxX2FsbG9jX3R5cGUgewo+ICAgKiBAbWFzazoJ
Q1BVIG1hc2sgZm9yIHZlY3RvciBhbGxvY2F0aW9uCj4gICAqIEBkZXNjOglQb2ludGVyIHRvIG1z
aSBkZXNjcmlwdG9yCj4gICAqIEBkYXRhOglBbGxvY2F0aW9uIHNwZWNpZmljIGRhdGEKPiArICoK
PiArICogQGlvYXBpYzoJSU9BUElDIHNwZWNpZmljIGFsbG9jYXRpb24gZGF0YQo+ICAgKi8KPiAg
c3RydWN0IGlycV9hbGxvY19pbmZvIHsKPiAgCWVudW0gaXJxX2FsbG9jX3R5cGUJdHlwZTsKPiBA
QCAtNjQsNiArNzUsNyBAQCBzdHJ1Y3QgaXJxX2FsbG9jX2luZm8gewo+ICAJdm9pZAkJCSpkYXRh
Owo+ICAKPiAgCXVuaW9uIHsKPiArCQlzdHJ1Y3QgaW9hcGljX2FsbG9jX2luZm8JaW9hcGljOwo+
ICAJCWludAkJdW51c2VkOwo+ICAjaWZkZWYJQ09ORklHX1BDSV9NU0kKPiAgCQlzdHJ1Y3Qgewo+
IEBAIC03MSwxNyArODMsNiBAQCBzdHJ1Y3QgaXJxX2FsbG9jX2luZm8gewo+ICAJCQlpcnFfaHdf
bnVtYmVyX3QJbXNpX2h3aXJxOwo+ICAJCX07Cj4gICNlbmRpZgo+IC0jaWZkZWYJQ09ORklHX1g4
Nl9JT19BUElDCj4gLQkJc3RydWN0IHsKPiAtCQkJaW50CQlpb2FwaWNfaWQ7Cj4gLQkJCWludAkJ
aW9hcGljX3BpbjsKPiAtCQkJaW50CQlpb2FwaWNfbm9kZTsKPiAtCQkJdTMyCQlpb2FwaWNfdHJp
Z2dlciA6IDE7Cj4gLQkJCXUzMgkJaW9hcGljX3BvbGFyaXR5IDogMTsKPiAtCQkJdTMyCQlpb2Fw
aWNfdmFsaWQgOiAxOwo+IC0JCQlzdHJ1Y3QgSU9fQVBJQ19yb3V0ZV9lbnRyeSAqaW9hcGljX2Vu
dHJ5Owo+IC0JCX07Cj4gLSNlbmRpZgo+ICAjaWZkZWYJQ09ORklHX0RNQVJfVEFCTEUKPiAgCQlz
dHJ1Y3Qgewo+ICAJCQlpbnQJCWRtYXJfaWQ7Cj4gLS0tIGEvYXJjaC94ODYva2VybmVsL2FwaWMv
aW9fYXBpYy5jCj4gKysrIGIvYXJjaC94ODYva2VybmVsL2FwaWMvaW9fYXBpYy5jCj4gQEAgLTg2
MCwxMCArODYwLDEwIEBAIHZvaWQgaW9hcGljX3NldF9hbGxvY19hdHRyKHN0cnVjdCBpcnFfYWwK
PiAgewo+ICAJaW5pdF9pcnFfYWxsb2NfaW5mbyhpbmZvLCBOVUxMKTsKPiAgCWluZm8tPnR5cGUg
PSBYODZfSVJRX0FMTE9DX1RZUEVfSU9BUElDOwo+IC0JaW5mby0+aW9hcGljX25vZGUgPSBub2Rl
Owo+IC0JaW5mby0+aW9hcGljX3RyaWdnZXIgPSB0cmlnZ2VyOwo+IC0JaW5mby0+aW9hcGljX3Bv
bGFyaXR5ID0gcG9sYXJpdHk7Cj4gLQlpbmZvLT5pb2FwaWNfdmFsaWQgPSAxOwo+ICsJaW5mby0+
aW9hcGljLm5vZGUgPSBub2RlOwo+ICsJaW5mby0+aW9hcGljLnRyaWdnZXIgPSB0cmlnZ2VyOwo+
ICsJaW5mby0+aW9hcGljLnBvbGFyaXR5ID0gcG9sYXJpdHk7Cj4gKwlpbmZvLT5pb2FwaWMudmFs
aWQgPSAxOwo+ICB9Cj4gIAo+ICAjaWZuZGVmIENPTkZJR19BQ1BJCj4gQEAgLTg3OCwzMiArODc4
LDMyIEBAIHN0YXRpYyB2b2lkIGlvYXBpY19jb3B5X2FsbG9jX2F0dHIoc3RydWMKPiAgCj4gIAlj
b3B5X2lycV9hbGxvY19pbmZvKGRzdCwgc3JjKTsKPiAgCWRzdC0+dHlwZSA9IFg4Nl9JUlFfQUxM
T0NfVFlQRV9JT0FQSUM7Cj4gLQlkc3QtPmlvYXBpY19pZCA9IG1wY19pb2FwaWNfaWQoaW9hcGlj
X2lkeCk7Cj4gLQlkc3QtPmlvYXBpY19waW4gPSBwaW47Cj4gLQlkc3QtPmlvYXBpY192YWxpZCA9
IDE7Cj4gLQlpZiAoc3JjICYmIHNyYy0+aW9hcGljX3ZhbGlkKSB7Cj4gLQkJZHN0LT5pb2FwaWNf
bm9kZSA9IHNyYy0+aW9hcGljX25vZGU7Cj4gLQkJZHN0LT5pb2FwaWNfdHJpZ2dlciA9IHNyYy0+
aW9hcGljX3RyaWdnZXI7Cj4gLQkJZHN0LT5pb2FwaWNfcG9sYXJpdHkgPSBzcmMtPmlvYXBpY19w
b2xhcml0eTsKPiArCWRzdC0+ZGV2aWQgPSBtcGNfaW9hcGljX2lkKGlvYXBpY19pZHgpOwo+ICsJ
ZHN0LT5pb2FwaWMucGluID0gcGluOwo+ICsJZHN0LT5pb2FwaWMudmFsaWQgPSAxOwo+ICsJaWYg
KHNyYyAmJiBzcmMtPmlvYXBpYy52YWxpZCkgewo+ICsJCWRzdC0+aW9hcGljLm5vZGUgPSBzcmMt
PmlvYXBpYy5ub2RlOwo+ICsJCWRzdC0+aW9hcGljLnRyaWdnZXIgPSBzcmMtPmlvYXBpYy50cmln
Z2VyOwo+ICsJCWRzdC0+aW9hcGljLnBvbGFyaXR5ID0gc3JjLT5pb2FwaWMucG9sYXJpdHk7Cj4g
IAl9IGVsc2Ugewo+IC0JCWRzdC0+aW9hcGljX25vZGUgPSBOVU1BX05PX05PREU7Cj4gKwkJZHN0
LT5pb2FwaWMubm9kZSA9IE5VTUFfTk9fTk9ERTsKPiAgCQlpZiAoYWNwaV9nZXRfb3ZlcnJpZGVf
aXJxKGdzaSwgJnRyaWdnZXIsICZwb2xhcml0eSkgPj0gMCkgewo+IC0JCQlkc3QtPmlvYXBpY190
cmlnZ2VyID0gdHJpZ2dlcjsKPiAtCQkJZHN0LT5pb2FwaWNfcG9sYXJpdHkgPSBwb2xhcml0eTsK
PiArCQkJZHN0LT5pb2FwaWMudHJpZ2dlciA9IHRyaWdnZXI7Cj4gKwkJCWRzdC0+aW9hcGljLnBv
bGFyaXR5ID0gcG9sYXJpdHk7Cj4gIAkJfSBlbHNlIHsKPiAgCQkJLyoKPiAgCQkJICogUENJIGlu
dGVycnVwdHMgYXJlIGFsd2F5cyBhY3RpdmUgbG93IGxldmVsCj4gIAkJCSAqIHRyaWdnZXJlZC4K
PiAgCQkJICovCj4gLQkJCWRzdC0+aW9hcGljX3RyaWdnZXIgPSBJT0FQSUNfTEVWRUw7Cj4gLQkJ
CWRzdC0+aW9hcGljX3BvbGFyaXR5ID0gSU9BUElDX1BPTF9MT1c7Cj4gKwkJCWRzdC0+aW9hcGlj
LnRyaWdnZXIgPSBJT0FQSUNfTEVWRUw7Cj4gKwkJCWRzdC0+aW9hcGljLnBvbGFyaXR5ID0gSU9B
UElDX1BPTF9MT1c7Cj4gIAkJfQo+ICAJfQo+ICB9Cj4gIAo+ICBzdGF0aWMgaW50IGlvYXBpY19h
bGxvY19hdHRyX25vZGUoc3RydWN0IGlycV9hbGxvY19pbmZvICppbmZvKQo+ICB7Cj4gLQlyZXR1
cm4gKGluZm8gJiYgaW5mby0+aW9hcGljX3ZhbGlkKSA/IGluZm8tPmlvYXBpY19ub2RlIDogTlVN
QV9OT19OT0RFOwo+ICsJcmV0dXJuIChpbmZvICYmIGluZm8tPmlvYXBpYy52YWxpZCkgPyBpbmZv
LT5pb2FwaWMubm9kZSA6IE5VTUFfTk9fTk9ERTsKPiAgfQo+ICAKPiAgc3RhdGljIHZvaWQgbXBf
cmVnaXN0ZXJfaGFuZGxlcih1bnNpZ25lZCBpbnQgaXJxLCB1bnNpZ25lZCBsb25nIHRyaWdnZXIp
Cj4gQEAgLTkzMywxNCArOTMzLDE0IEBAIHN0YXRpYyBib29sIG1wX2NoZWNrX3Bpbl9hdHRyKGlu
dCBpcnEsIHMKPiAgCSAqIHBpbiB3aXRoIHJlYWwgdHJpZ2dlciBhbmQgcG9sYXJpdHkgYXR0cmli
dXRlcy4KPiAgCSAqLwo+ICAJaWYgKGlycSA8IG5yX2xlZ2FjeV9pcnFzKCkgJiYgZGF0YS0+Y291
bnQgPT0gMSkgewo+IC0JCWlmIChpbmZvLT5pb2FwaWNfdHJpZ2dlciAhPSBkYXRhLT50cmlnZ2Vy
KQo+IC0JCQltcF9yZWdpc3Rlcl9oYW5kbGVyKGlycSwgaW5mby0+aW9hcGljX3RyaWdnZXIpOwo+
IC0JCWRhdGEtPmVudHJ5LnRyaWdnZXIgPSBkYXRhLT50cmlnZ2VyID0gaW5mby0+aW9hcGljX3Ry
aWdnZXI7Cj4gLQkJZGF0YS0+ZW50cnkucG9sYXJpdHkgPSBkYXRhLT5wb2xhcml0eSA9IGluZm8t
PmlvYXBpY19wb2xhcml0eTsKPiArCQlpZiAoaW5mby0+aW9hcGljLnRyaWdnZXIgIT0gZGF0YS0+
dHJpZ2dlcikKPiArCQkJbXBfcmVnaXN0ZXJfaGFuZGxlcihpcnEsIGluZm8tPmlvYXBpYy50cmln
Z2VyKTsKPiArCQlkYXRhLT5lbnRyeS50cmlnZ2VyID0gZGF0YS0+dHJpZ2dlciA9IGluZm8tPmlv
YXBpYy50cmlnZ2VyOwo+ICsJCWRhdGEtPmVudHJ5LnBvbGFyaXR5ID0gZGF0YS0+cG9sYXJpdHkg
PSBpbmZvLT5pb2FwaWMucG9sYXJpdHk7Cj4gIAl9Cj4gIAo+IC0JcmV0dXJuIGRhdGEtPnRyaWdn
ZXIgPT0gaW5mby0+aW9hcGljX3RyaWdnZXIgJiYKPiAtCSAgICAgICBkYXRhLT5wb2xhcml0eSA9
PSBpbmZvLT5pb2FwaWNfcG9sYXJpdHk7Cj4gKwlyZXR1cm4gZGF0YS0+dHJpZ2dlciA9PSBpbmZv
LT5pb2FwaWMudHJpZ2dlciAmJgo+ICsJICAgICAgIGRhdGEtPnBvbGFyaXR5ID09IGluZm8tPmlv
YXBpYy5wb2xhcml0eTsKPiAgfQo+ICAKPiAgc3RhdGljIGludCBhbGxvY19pcnFfZnJvbV9kb21h
aW4oc3RydWN0IGlycV9kb21haW4gKmRvbWFpbiwgaW50IGlvYXBpYywgdTMyIGdzaSwKPiBAQCAt
MTAwMiw3ICsxMDAyLDcgQEAgc3RhdGljIGludCBhbGxvY19pc2FfaXJxX2Zyb21fZG9tYWluKHN0
cgo+ICAJCWlmICghbXBfY2hlY2tfcGluX2F0dHIoaXJxLCBpbmZvKSkKPiAgCQkJcmV0dXJuIC1F
QlVTWTsKPiAgCQlpZiAoX19hZGRfcGluX3RvX2lycV9ub2RlKGlycV9kYXRhLT5jaGlwX2RhdGEs
IG5vZGUsIGlvYXBpYywKPiAtCQkJCQkgIGluZm8tPmlvYXBpY19waW4pKQo+ICsJCQkJCSAgaW5m
by0+aW9hcGljLnBpbikpCj4gIAkJCXJldHVybiAtRU5PTUVNOwo+ICAJfSBlbHNlIHsKPiAgCQlp
bmZvLT5mbGFncyB8PSBYODZfSVJRX0FMTE9DX0xFR0FDWTsKPiBAQCAtMjA5Miw4ICsyMDkyLDgg
QEAgc3RhdGljIGludCBtcF9hbGxvY190aW1lcl9pcnEoaW50IGlvYXBpYwo+ICAJCXN0cnVjdCBp
cnFfYWxsb2NfaW5mbyBpbmZvOwo+ICAKPiAgCQlpb2FwaWNfc2V0X2FsbG9jX2F0dHIoJmluZm8s
IE5VTUFfTk9fTk9ERSwgMCwgMCk7Cj4gLQkJaW5mby5pb2FwaWNfaWQgPSBtcGNfaW9hcGljX2lk
KGlvYXBpYyk7Cj4gLQkJaW5mby5pb2FwaWNfcGluID0gcGluOwo+ICsJCWluZm8uZGV2aWQgPSBt
cGNfaW9hcGljX2lkKGlvYXBpYyk7Cj4gKwkJaW5mby5pb2FwaWMucGluID0gcGluOwo+ICAJCW11
dGV4X2xvY2soJmlvYXBpY19tdXRleCk7Cj4gIAkJaXJxID0gYWxsb2NfaXNhX2lycV9mcm9tX2Rv
bWFpbihkb21haW4sIDAsIGlvYXBpYywgcGluLCAmaW5mbyk7Cj4gIAkJbXV0ZXhfdW5sb2NrKCZp
b2FwaWNfbXV0ZXgpOwo+IEBAIC0yMjk3LDcgKzIyOTcsNyBAQCBzdGF0aWMgaW50IG1wX2lycWRv
bWFpbl9jcmVhdGUoaW50IGlvYXBpCj4gIAo+ICAJaW5pdF9pcnFfYWxsb2NfaW5mbygmaW5mbywg
TlVMTCk7Cj4gIAlpbmZvLnR5cGUgPSBYODZfSVJRX0FMTE9DX1RZUEVfSU9BUElDX0dFVF9QQVJF
TlQ7Cj4gLQlpbmZvLmlvYXBpY19pZCA9IG1wY19pb2FwaWNfaWQoaW9hcGljKTsKPiArCWluZm8u
ZGV2aWQgPSBtcGNfaW9hcGljX2lkKGlvYXBpYyk7Cj4gIAlwYXJlbnQgPSBpcnFfcmVtYXBwaW5n
X2dldF9pcnFfZG9tYWluKCZpbmZvKTsKPiAgCWlmICghcGFyZW50KQo+ICAJCXBhcmVudCA9IHg4
Nl92ZWN0b3JfZG9tYWluOwo+IEBAIC0yOTMyLDkgKzI5MzIsOSBAQCBpbnQgbXBfaW9hcGljX3Jl
Z2lzdGVyZWQodTMyIGdzaV9iYXNlKQo+ICBzdGF0aWMgdm9pZCBtcF9pcnFkb21haW5fZ2V0X2F0
dHIodTMyIGdzaSwgc3RydWN0IG1wX2NoaXBfZGF0YSAqZGF0YSwKPiAgCQkJCSAgc3RydWN0IGly
cV9hbGxvY19pbmZvICppbmZvKQo+ICB7Cj4gLQlpZiAoaW5mbyAmJiBpbmZvLT5pb2FwaWNfdmFs
aWQpIHsKPiAtCQlkYXRhLT50cmlnZ2VyID0gaW5mby0+aW9hcGljX3RyaWdnZXI7Cj4gLQkJZGF0
YS0+cG9sYXJpdHkgPSBpbmZvLT5pb2FwaWNfcG9sYXJpdHk7Cj4gKwlpZiAoaW5mbyAmJiBpbmZv
LT5pb2FwaWMudmFsaWQpIHsKPiArCQlkYXRhLT50cmlnZ2VyID0gaW5mby0+aW9hcGljLnRyaWdn
ZXI7Cj4gKwkJZGF0YS0+cG9sYXJpdHkgPSBpbmZvLT5pb2FwaWMucG9sYXJpdHk7Cj4gIAl9IGVs
c2UgaWYgKGFjcGlfZ2V0X292ZXJyaWRlX2lycShnc2ksICZkYXRhLT50cmlnZ2VyLAo+ICAJCQkJ
CSAmZGF0YS0+cG9sYXJpdHkpIDwgMCkgewo+ICAJCS8qIFBDSSBpbnRlcnJ1cHRzIGFyZSBhbHdh
eXMgYWN0aXZlIGxvdyBsZXZlbCB0cmlnZ2VyZWQuICovCj4gQEAgLTI5ODAsNyArMjk4MCw3IEBA
IGludCBtcF9pcnFkb21haW5fYWxsb2Moc3RydWN0IGlycV9kb21haW4KPiAgCQlyZXR1cm4gLUVJ
TlZBTDsKPiAgCj4gIAlpb2FwaWMgPSBtcF9pcnFkb21haW5faW9hcGljX2lkeChkb21haW4pOwo+
IC0JcGluID0gaW5mby0+aW9hcGljX3BpbjsKPiArCXBpbiA9IGluZm8tPmlvYXBpYy5waW47Cj4g
IAlpZiAoaXJxX2ZpbmRfbWFwcGluZyhkb21haW4sIChpcnFfaHdfbnVtYmVyX3QpcGluKSA+IDAp
Cj4gIAkJcmV0dXJuIC1FRVhJU1Q7Cj4gIAo+IEBAIC0yOTg4LDcgKzI5ODgsNyBAQCBpbnQgbXBf
aXJxZG9tYWluX2FsbG9jKHN0cnVjdCBpcnFfZG9tYWluCj4gIAlpZiAoIWRhdGEpCj4gIAkJcmV0
dXJuIC1FTk9NRU07Cj4gIAo+IC0JaW5mby0+aW9hcGljX2VudHJ5ID0gJmRhdGEtPmVudHJ5Owo+
ICsJaW5mby0+aW9hcGljLmVudHJ5ID0gJmRhdGEtPmVudHJ5Owo+ICAJcmV0ID0gaXJxX2RvbWFp
bl9hbGxvY19pcnFzX3BhcmVudChkb21haW4sIHZpcnEsIG5yX2lycXMsIGluZm8pOwo+ICAJaWYg
KHJldCA8IDApIHsKPiAgCQlrZnJlZShkYXRhKTsKPiBAQCAtMjk5Niw3ICsyOTk2LDcgQEAgaW50
IG1wX2lycWRvbWFpbl9hbGxvYyhzdHJ1Y3QgaXJxX2RvbWFpbgo+ICAJfQo+ICAKPiAgCUlOSVRf
TElTVF9IRUFEKCZkYXRhLT5pcnFfMl9waW4pOwo+IC0JaXJxX2RhdGEtPmh3aXJxID0gaW5mby0+
aW9hcGljX3BpbjsKPiArCWlycV9kYXRhLT5od2lycSA9IGluZm8tPmlvYXBpYy5waW47Cj4gIAlp
cnFfZGF0YS0+Y2hpcCA9IChkb21haW4tPnBhcmVudCA9PSB4ODZfdmVjdG9yX2RvbWFpbikgPwo+
ICAJCQkgICZpb2FwaWNfY2hpcCA6ICZpb2FwaWNfaXJfY2hpcDsKPiAgCWlycV9kYXRhLT5jaGlw
X2RhdGEgPSBkYXRhOwo+IEBAIC0zMDA2LDggKzMwMDYsOCBAQCBpbnQgbXBfaXJxZG9tYWluX2Fs
bG9jKHN0cnVjdCBpcnFfZG9tYWluCj4gIAlhZGRfcGluX3RvX2lycV9ub2RlKGRhdGEsIGlvYXBp
Y19hbGxvY19hdHRyX25vZGUoaW5mbyksIGlvYXBpYywgcGluKTsKPiAgCj4gIAlsb2NhbF9pcnFf
c2F2ZShmbGFncyk7Cj4gLQlpZiAoaW5mby0+aW9hcGljX2VudHJ5KQo+IC0JCW1wX3NldHVwX2Vu
dHJ5KGNmZywgZGF0YSwgaW5mby0+aW9hcGljX2VudHJ5KTsKPiArCWlmIChpbmZvLT5pb2FwaWMu
ZW50cnkpCj4gKwkJbXBfc2V0dXBfZW50cnkoY2ZnLCBkYXRhLCBpbmZvLT5pb2FwaWMuZW50cnkp
Owo+ICAJbXBfcmVnaXN0ZXJfaGFuZGxlcih2aXJxLCBkYXRhLT50cmlnZ2VyKTsKPiAgCWlmICh2
aXJxIDwgbnJfbGVnYWN5X2lycXMoKSkKPiAgCQlsZWdhY3lfcGljLT5tYXNrKHZpcnEpOwo+IC0t
LSBhL2RyaXZlcnMvaW9tbXUvYW1kL2lvbW11LmMKPiArKysgYi9kcml2ZXJzL2lvbW11L2FtZC9p
b21tdS5jCj4gQEAgLTM1MDgsNyArMzUwOCw3IEBAIHN0YXRpYyBpbnQgZ2V0X2RldmlkKHN0cnVj
dCBpcnFfYWxsb2NfaW4KPiAgCXN3aXRjaCAoaW5mby0+dHlwZSkgewo+ICAJY2FzZSBYODZfSVJR
X0FMTE9DX1RZUEVfSU9BUElDOgo+ICAJY2FzZSBYODZfSVJRX0FMTE9DX1RZUEVfSU9BUElDX0dF
VF9QQVJFTlQ6Cj4gLQkJcmV0dXJuIGdldF9pb2FwaWNfZGV2aWQoaW5mby0+aW9hcGljX2lkKTsK
PiArCQlyZXR1cm4gZ2V0X2lvYXBpY19kZXZpZChpbmZvLT5kZXZpZCk7Cj4gIAljYXNlIFg4Nl9J
UlFfQUxMT0NfVFlQRV9IUEVUOgo+ICAJY2FzZSBYODZfSVJRX0FMTE9DX1RZUEVfSFBFVF9HRVRf
UEFSRU5UOgo+ICAJCXJldHVybiBnZXRfaHBldF9kZXZpZChpbmZvLT5kZXZpZCk7Cj4gQEAgLTM1
ODYsMTUgKzM1ODYsMTUgQEAgc3RhdGljIHZvaWQgaXJxX3JlbWFwcGluZ19wcmVwYXJlX2lydGUo
cwo+ICAJc3dpdGNoIChpbmZvLT50eXBlKSB7Cj4gIAljYXNlIFg4Nl9JUlFfQUxMT0NfVFlQRV9J
T0FQSUM6Cj4gIAkJLyogU2V0dXAgSU9BUElDIGVudHJ5ICovCj4gLQkJZW50cnkgPSBpbmZvLT5p
b2FwaWNfZW50cnk7Cj4gLQkJaW5mby0+aW9hcGljX2VudHJ5ID0gTlVMTDsKPiArCQllbnRyeSA9
IGluZm8tPmlvYXBpYy5lbnRyeTsKPiArCQlpbmZvLT5pb2FwaWMuZW50cnkgPSBOVUxMOwo+ICAJ
CW1lbXNldChlbnRyeSwgMCwgc2l6ZW9mKCplbnRyeSkpOwo+ICAJCWVudHJ5LT52ZWN0b3IgICAg
ICAgID0gaW5kZXg7Cj4gIAkJZW50cnktPm1hc2sgICAgICAgICAgPSAwOwo+IC0JCWVudHJ5LT50
cmlnZ2VyICAgICAgID0gaW5mby0+aW9hcGljX3RyaWdnZXI7Cj4gLQkJZW50cnktPnBvbGFyaXR5
ICAgICAgPSBpbmZvLT5pb2FwaWNfcG9sYXJpdHk7Cj4gKwkJZW50cnktPnRyaWdnZXIgICAgICAg
PSBpbmZvLT5pb2FwaWMudHJpZ2dlcjsKPiArCQllbnRyeS0+cG9sYXJpdHkgICAgICA9IGluZm8t
PmlvYXBpYy5wb2xhcml0eTsKPiAgCQkvKiBNYXNrIGxldmVsIHRyaWdnZXJlZCBpcnFzLiAqLwo+
IC0JCWlmIChpbmZvLT5pb2FwaWNfdHJpZ2dlcikKPiArCQlpZiAoaW5mby0+aW9hcGljLnRyaWdn
ZXIpCj4gIAkJCWVudHJ5LT5tYXNrID0gMTsKPiAgCQlicmVhazsKPiAgCj4gQEAgLTM2ODAsNyAr
MzY4MCw3IEBAIHN0YXRpYyBpbnQgaXJxX3JlbWFwcGluZ19hbGxvYyhzdHJ1Y3QgaXIKPiAgCQkJ
CQlpb21tdS0+aXJ0ZV9vcHMtPnNldF9hbGxvY2F0ZWQodGFibGUsIGkpOwo+ICAJCQl9Cj4gIAkJ
CVdBUk5fT04odGFibGUtPm1pbl9pbmRleCAhPSAzMik7Cj4gLQkJCWluZGV4ID0gaW5mby0+aW9h
cGljX3BpbjsKPiArCQkJaW5kZXggPSBpbmZvLT5pb2FwaWMucGluOwo+ICAJCX0gZWxzZSB7Cj4g
IAkJCWluZGV4ID0gLUVOT01FTTsKPiAgCQl9Cj4gLS0tIGEvZHJpdmVycy9pb21tdS9oeXBlcnYt
aW9tbXUuYwo+ICsrKyBiL2RyaXZlcnMvaW9tbXUvaHlwZXJ2LWlvbW11LmMKPiBAQCAtMTAxLDcg
KzEwMSw3IEBAIHN0YXRpYyBpbnQgaHlwZXJ2X2lycV9yZW1hcHBpbmdfYWxsb2Moc3QKPiAgCSAq
IGluIHRoZSBjaGlwX2RhdGEgYW5kIGh5cGVydl9pcnFfcmVtYXBwaW5nX2FjdGl2YXRlKCkvaHlw
ZXJ2X2lyX3NldF8KPiAgCSAqIGFmZmluaXR5KCkgc2V0IHZlY3RvciBhbmQgZGVzdF9hcGljaWQg
ZGlyZWN0bHkgaW50byBJTy1BUElDIGVudHJ5Lgo+ICAJICovCj4gLQlpcnFfZGF0YS0+Y2hpcF9k
YXRhID0gaW5mby0+aW9hcGljX2VudHJ5Owo+ICsJaXJxX2RhdGEtPmNoaXBfZGF0YSA9IGluZm8t
PmlvYXBpYy5lbnRyeTsKPiAgCj4gIAkvKgo+ICAJICogSHlwdmVyLVYgSU8gQVBJQyBpcnEgYWZm
aW5pdHkgc2hvdWxkIGJlIGluIHRoZSBzY29wZSBvZgo+IC0tLSBhL2RyaXZlcnMvaW9tbXUvaW50
ZWwvaXJxX3JlbWFwcGluZy5jCj4gKysrIGIvZHJpdmVycy9pb21tdS9pbnRlbC9pcnFfcmVtYXBw
aW5nLmMKPiBAQCAtMTExMyw3ICsxMTEzLDcgQEAgc3RhdGljIHN0cnVjdCBpcnFfZG9tYWluICpp
bnRlbF9nZXRfaXJxXwo+ICAKPiAgCXN3aXRjaCAoaW5mby0+dHlwZSkgewo+ICAJY2FzZSBYODZf
SVJRX0FMTE9DX1RZUEVfSU9BUElDX0dFVF9QQVJFTlQ6Cj4gLQkJcmV0dXJuIG1hcF9pb2FwaWNf
dG9faXIoaW5mby0+aW9hcGljX2lkKTsKPiArCQlyZXR1cm4gbWFwX2lvYXBpY190b19pcihpbmZv
LT5kZXZpZCk7Cj4gIAljYXNlIFg4Nl9JUlFfQUxMT0NfVFlQRV9IUEVUX0dFVF9QQVJFTlQ6Cj4g
IAkJcmV0dXJuIG1hcF9ocGV0X3RvX2lyKGluZm8tPmRldmlkKTsKPiAgCWNhc2UgWDg2X0lSUV9B
TExPQ19UWVBFX1BDSV9NU0k6Cj4gQEAgLTEyNTQsMTYgKzEyNTQsMTYgQEAgc3RhdGljIHZvaWQg
aW50ZWxfaXJxX3JlbWFwcGluZ19wcmVwYXJlXwo+ICAJc3dpdGNoIChpbmZvLT50eXBlKSB7Cj4g
IAljYXNlIFg4Nl9JUlFfQUxMT0NfVFlQRV9JT0FQSUM6Cj4gIAkJLyogU2V0IHNvdXJjZS1pZCBv
ZiBpbnRlcnJ1cHQgcmVxdWVzdCAqLwo+IC0JCXNldF9pb2FwaWNfc2lkKGlydGUsIGluZm8tPmlv
YXBpY19pZCk7Cj4gKwkJc2V0X2lvYXBpY19zaWQoaXJ0ZSwgaW5mby0+ZGV2aWQpOwo+ICAJCWFw
aWNfcHJpbnRrKEFQSUNfVkVSQk9TRSwgS0VSTl9ERUJVRyAiSU9BUElDWyVkXTogU2V0IElSVEUg
ZW50cnkgKFA6JWQgRlBEOiVkIERzdF9Nb2RlOiVkIFJlZGlyX2hpbnQ6JWQgVHJpZ19Nb2RlOiVk
IERsdnJ5X01vZGU6JVggQXZhaWw6JVggVmVjdG9yOiUwMlggRGVzdDolMDhYIFNJRDolMDRYIFNR
OiVYIFNWVDolWClcbiIsCj4gLQkJCWluZm8tPmlvYXBpY19pZCwgaXJ0ZS0+cHJlc2VudCwgaXJ0
ZS0+ZnBkLAo+ICsJCQlpbmZvLT5kZXZpZCwgaXJ0ZS0+cHJlc2VudCwgaXJ0ZS0+ZnBkLAo+ICAJ
CQlpcnRlLT5kc3RfbW9kZSwgaXJ0ZS0+cmVkaXJfaGludCwKPiAgCQkJaXJ0ZS0+dHJpZ2dlcl9t
b2RlLCBpcnRlLT5kbHZyeV9tb2RlLAo+ICAJCQlpcnRlLT5hdmFpbCwgaXJ0ZS0+dmVjdG9yLCBp
cnRlLT5kZXN0X2lkLAo+ICAJCQlpcnRlLT5zaWQsIGlydGUtPnNxLCBpcnRlLT5zdnQpOwo+ICAK
PiAtCQllbnRyeSA9IChzdHJ1Y3QgSVJfSU9fQVBJQ19yb3V0ZV9lbnRyeSAqKWluZm8tPmlvYXBp
Y19lbnRyeTsKPiAtCQlpbmZvLT5pb2FwaWNfZW50cnkgPSBOVUxMOwo+ICsJCWVudHJ5ID0gKHN0
cnVjdCBJUl9JT19BUElDX3JvdXRlX2VudHJ5ICopaW5mby0+aW9hcGljLmVudHJ5Owo+ICsJCWlu
Zm8tPmlvYXBpYy5lbnRyeSA9IE5VTEw7Cj4gIAkJbWVtc2V0KGVudHJ5LCAwLCBzaXplb2YoKmVu
dHJ5KSk7Cj4gIAkJZW50cnktPmluZGV4Mgk9IChpbmRleCA+PiAxNSkgJiAweDE7Cj4gIAkJZW50
cnktPnplcm8JPSAwOwo+IEBAIC0xMjczLDExICsxMjczLDExIEBAIHN0YXRpYyB2b2lkIGludGVs
X2lycV9yZW1hcHBpbmdfcHJlcGFyZV8KPiAgCQkgKiBJTy1BUElDIFJURSB3aWxsIGJlIGNvbmZp
Z3VyZWQgd2l0aCB2aXJ0dWFsIHZlY3Rvci4KPiAgCQkgKiBpcnEgaGFuZGxlciB3aWxsIGRvIHRo
ZSBleHBsaWNpdCBFT0kgdG8gdGhlIGlvLWFwaWMuCj4gIAkJICovCj4gLQkJZW50cnktPnZlY3Rv
cgk9IGluZm8tPmlvYXBpY19waW47Cj4gKwkJZW50cnktPnZlY3Rvcgk9IGluZm8tPmlvYXBpYy5w
aW47Cj4gIAkJZW50cnktPm1hc2sJPSAwOwkJCS8qIGVuYWJsZSBJUlEgKi8KPiAtCQllbnRyeS0+
dHJpZ2dlcgk9IGluZm8tPmlvYXBpY190cmlnZ2VyOwo+IC0JCWVudHJ5LT5wb2xhcml0eQk9IGlu
Zm8tPmlvYXBpY19wb2xhcml0eTsKPiAtCQlpZiAoaW5mby0+aW9hcGljX3RyaWdnZXIpCj4gKwkJ
ZW50cnktPnRyaWdnZXIJPSBpbmZvLT5pb2FwaWMudHJpZ2dlcjsKPiArCQllbnRyeS0+cG9sYXJp
dHkJPSBpbmZvLT5pb2FwaWMucG9sYXJpdHk7Cj4gKwkJaWYgKGluZm8tPmlvYXBpYy50cmlnZ2Vy
KQo+ICAJCQllbnRyeS0+bWFzayA9IDE7IC8qIE1hc2sgbGV2ZWwgdHJpZ2dlcmVkIGlycXMuICov
Cj4gIAkJYnJlYWs7Cj4gIAo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwppb21tdSBtYWlsaW5nIGxpc3QKaW9tbXVAbGlzdHMubGludXgtZm91bmRhdGlv
bi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8v
aW9tbXU=
