Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id F015F27E271
	for <lists.iommu@lfdr.de>; Wed, 30 Sep 2020 09:17:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 83E0185F4B;
	Wed, 30 Sep 2020 07:17:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Px4H0ALWpD6Z; Wed, 30 Sep 2020 07:17:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3068985FC9;
	Wed, 30 Sep 2020 07:17:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 268EEC0051;
	Wed, 30 Sep 2020 07:17:50 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 38CD2C0051
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 07:17:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 24C1F86844
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 07:17:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GOBmzXt83ZL1 for <iommu@lists.linux-foundation.org>;
 Wed, 30 Sep 2020 07:17:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 6B18A86840
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 07:17:48 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id l126so556104pfd.5
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 00:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=SATX+yBCLXXjqiez9Tnf9l7cIDz62fOgQbhS4ETQ5yQ=;
 b=uVAsy1IP7fkjUycX+Ge5M2rkDhVaWrw6jrYanW0tg5N6L/WPjZe7zqXCg6aCRS6Vko
 sJadbahrKxhzzQKrXczU0Egn+pdH4aE7Qh2NHwCM7gOBg2TgBEi6tzngrTDkkc/D0P2R
 AYewwzO1+AxcABTCvw3EGOmcQoLMqEeL0zrGGI6Yi2J1PEc6xumer+jum8cwcztq3ISJ
 4YrfyTzmNGZsJvR7lXFLmawc00eQUVs0cJhf9bwbiniv0RF21CYtCyeSl/Bmmo0zwygg
 y4X4vb+Xq50bBSLJEi67ALoAZew2RVCa3+08Uz3+KYCCVXePJ1lKY0bq5ae9SVmUBfxI
 CsmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=SATX+yBCLXXjqiez9Tnf9l7cIDz62fOgQbhS4ETQ5yQ=;
 b=g+t3aP7NUEW5ntTFStVIbLdG+NMqN9qpY8Ghv5ZKckEZTa4nUBAGTAyvaKFrWS6wqr
 KMO2fPEfeE3o4IBaPVY6yI71FI9QM3ZIom6oQ9gk64XqvEoijL5FSi9iWu3S1rMZYFcb
 A59WTXXNaQTO4dAIjaYGy/Xjel1PnoFPEg4a1Mb2PGnf3rHLM6d9nBFnR49KRlUZ0Qyn
 zS4nx7u2FkRM0GNgRxwC/nPjA4damnKyllSmh2tQ82vtWSa4l1EuLzX28x87zAZg+h5z
 e/ST6w5s+5MYPLLbOygqndq23isWNCOLTx7Zv97RvQEtAcy+s1aXjAjsJFLLWH/3uj9s
 xhww==
X-Gm-Message-State: AOAM533326o/EZP8CXKE+zoYC7kwjNzo/zQx5+3buzRFoRS1R9CoLVGI
 nrVezLQDu7Cd3aeWTsmGUJc=
X-Google-Smtp-Source: ABdhPJznBREyrIM8kWonCXk01Di+K4rbkU4w4E5kpyQV5G7rxm4yz+Ji8inYERq2GeDN2G0bJgxz4A==
X-Received: by 2002:a62:62c3:0:b029:151:223b:3ba0 with SMTP id
 w186-20020a6262c30000b0290151223b3ba0mr1157265pfb.28.1601450267941; 
 Wed, 30 Sep 2020 00:17:47 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id 9sm1088537pgx.76.2020.09.30.00.17.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 30 Sep 2020 00:17:47 -0700 (PDT)
Date: Wed, 30 Sep 2020 00:12:14 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 3/3] iommu/tegra-smmu: Add PCI support
Message-ID: <20200930071213.GA13876@Asurada-Nvidia>
References: <20200930003013.31289-1-nicoleotsuka@gmail.com>
 <20200930003013.31289-4-nicoleotsuka@gmail.com>
 <5a91f07c-bc27-7607-915c-e98a7a0c4b24@gmail.com>
 <20200930053425.GC31821@Asurada-Nvidia>
 <84f05ebd-1123-5dfb-94fe-62564a21706f@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <84f05ebd-1123-5dfb-94fe-62564a21706f@gmail.com>
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

T24gV2VkLCBTZXAgMzAsIDIwMjAgYXQgMDk6MDE6MDlBTSArMDMwMCwgRG1pdHJ5IE9zaXBlbmtv
IHdyb3RlOgo+IDMwLjA5LjIwMjAgMDg6MzQsIE5pY29saW4gQ2hlbiDQv9C40YjQtdGCOgo+ID4g
T24gV2VkLCBTZXAgMzAsIDIwMjAgYXQgMDg6MTA6MzVBTSArMDMwMCwgRG1pdHJ5IE9zaXBlbmtv
IHdyb3RlOgo+ID4+IDMwLjA5LjIwMjAgMDM6MzAsIE5pY29saW4gQ2hlbiDQv9C40YjQtdGCOgo+
ID4+PiAgdm9pZCB0ZWdyYV9zbW11X3JlbW92ZShzdHJ1Y3QgdGVncmFfc21tdSAqc21tdSkKPiA+
Pj4gIHsKPiA+Pj4gKwlidXNfc2V0X2lvbW11KCZwbGF0Zm9ybV9idXNfdHlwZSwgTlVMTCk7Cj4g
Pj4KPiA+PiBXaHkgb25seSBwbGF0Zm9ybV9idXM/IElzIHRoaXMgcmVhbGx5IG5lZWRlZCBhdCBh
bGw/Cj4gPiAKPiA+IEkgc2VlIHFjb21faW9tbXUuYyBmaWxlIHNldCB0byBOVUxMIGluIHJlbW92
ZSgpLCBQcm9iYWJseSBzaG91bGQKPiA+IGhhdmUgYWRkZWQgcGNpX2J1c190eXBlIHRvbyB0aG91
Z2guCj4gPiAKPiA+IE9yIGFyZSB5b3Ugc3VyZSB0aGF0IHRoZXJlJ3Mgbm8gbmVlZCBhdCBhbGw/
Cj4gPiAKPiAKPiBJdCB3YXNuJ3QgaGVyZSBiZWZvcmUgdGhpcyBwYXRjaCBhbmQgcGxhdGZvcm1f
YnVzIGlzIHVucmVsYXRlZCB0byB0aGUKPiB0b3BpYyBvZiB0aGlzIHBhdGNoLiBCdXQgaXQgcHJv
YmFibHkgc2hvdWxkIGJlIHRoZXJlLgo+IAo+IE9uIHRoZSBvdGhlciBoYW5kLCB0aGUgdGVncmFf
c21tdV9yZW1vdmUoKSBpcyB1bnVzZWQgYW5kIG1heWJlIGl0IGNvdWxkCj4gYmUgYmV0dGVyIHRv
IGdldCByaWQgb2YgdGhpcyB1bnVzZWQgZnVuY3Rpb24gYXQgYWxsLgoKSSB3aWxsIGRyb3AgdGhp
cyBsaW5lIHRoZW4sIHNpbmNlIG5vIG9uZSBpcyBjYWxsaW5nIGl0LiBBbmQgbWF5YmUKd2UgY2Fu
IHN1Ym1pdCBhIGNsZWFuIHVwIHBhdGNoIGxhdGVyLgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwppb21tdSBtYWlsaW5nIGxpc3QKaW9tbXVAbGlzdHMubGlu
dXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxt
YW4vbGlzdGluZm8vaW9tbXU=
