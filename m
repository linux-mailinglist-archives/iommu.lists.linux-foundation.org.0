Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D1E27B76B
	for <lists.iommu@lfdr.de>; Tue, 29 Sep 2020 00:36:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 30C2B85CA8;
	Mon, 28 Sep 2020 22:36:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b6zmPNoonsPr; Mon, 28 Sep 2020 22:36:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B46A285B55;
	Mon, 28 Sep 2020 22:36:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 89E38C0051;
	Mon, 28 Sep 2020 22:36:36 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 037F6C0051
 for <iommu@lists.linux-foundation.org>; Mon, 28 Sep 2020 22:36:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id ED31C8638F
 for <iommu@lists.linux-foundation.org>; Mon, 28 Sep 2020 22:36:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t5asBiN94xKC for <iommu@lists.linux-foundation.org>;
 Mon, 28 Sep 2020 22:36:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 54A7786378
 for <iommu@lists.linux-foundation.org>; Mon, 28 Sep 2020 22:36:34 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id jw11so1545738pjb.0
 for <iommu@lists.linux-foundation.org>; Mon, 28 Sep 2020 15:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=6VTtpf0GOcmVXtgSMfPaTRHueLjXIvDxPhjzc/PdAkg=;
 b=gw/yuW8w3S9Bqz49rkSLpd0r4ay4B+eMFsWiZ0IzmbaF2ogdNKuuLcfrwmIFtSVhLq
 wmwfRBMhw3z8Mp26zzmLnxUjimNAPhX8fuWMP8PtwVjXn3kfZCftZ+GJACFvoYhzzq8E
 Vd0xIKfdYrwaN/Jv+ff0fyxmY8dWR0z7YxK2lnXMeUbuSMnXi2EHUeCEXj01fmrnXi3H
 giucjV1rCRiwXqXcKgTbYlz3UiQOB4CuUBUpaDH4SjGALymaCOmvUSnrohA9iKykv93e
 eylBH/03Cxp0DRKm0+l8yuTZlcKbUNwgLt0ySvqvt9o5J7Sh4gQg3fZ/p9/Bi3neatyf
 U4FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=6VTtpf0GOcmVXtgSMfPaTRHueLjXIvDxPhjzc/PdAkg=;
 b=e+2CYjRNwkGDbkdSyez10Y0jjdUAk8V/TZBPCFszIpShKL3bvRVGIl0uv91+G9sJyE
 WXGDT87loVgTEJDNfp8fuS//W0x0PDN2CiUCbiyxq8ViFzFTNJ9ua/tKkglkMjPAtgQw
 6DXkhYsCRxO3Dp9ekqbnkiOw7PkILUiObh5aJIIy2VFEFFcfk9X3TCr+afwv2pgwkf1/
 cBCBc/SsdhvcxRSGe2eRzNvtAEZ5COAK6myiLGXGpcM4gLxlBRSotgn7EMiBsN3PUbzi
 /R4307mvRcpZTCEuwP3JQ82TRXzA1EBuYgElS8hD5qo4M7ha93+4KG1ZxWhwF6Q6je0O
 X+Rw==
X-Gm-Message-State: AOAM530KZAVampdYuSkPRTB5uF+xALcnfuXACmDaEBQcelosGBAs24Nx
 ZlEMh9N6DAdt6jl3GTzvhjA=
X-Google-Smtp-Source: ABdhPJxEB21pc/IzM51H1ZIwi+20mLY4wZP51SX9dQ3cfquh4GSqAy3OjkJt5SXGb/l2OBcOb/h61w==
X-Received: by 2002:a17:90b:2345:: with SMTP id
 ms5mr1164167pjb.202.1601332593920; 
 Mon, 28 Sep 2020 15:36:33 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id a2sm2583492pfk.201.2020.09.28.15.36.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 28 Sep 2020 15:36:33 -0700 (PDT)
Date: Mon, 28 Sep 2020 15:31:15 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH 4/5] iommu/tegra-smmu: Add PCI support
Message-ID: <20200928223114.GA4816@Asurada-Nvidia>
References: <20200926080719.6822-1-nicoleotsuka@gmail.com>
 <20200926080719.6822-5-nicoleotsuka@gmail.com>
 <b95b69fb-8570-f5dc-c486-b94958f2a791@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b95b69fb-8570-f5dc-c486-b94958f2a791@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: linux-kernel@vger.kernel.org, krzk@kernel.org, jonathanh@nvidia.com,
 iommu@lists.linux-foundation.org, thierry.reding@gmail.com,
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

T24gU3VuLCBTZXAgMjcsIDIwMjAgYXQgMDE6MTg6MTVBTSArMDMwMCwgRG1pdHJ5IE9zaXBlbmtv
IHdyb3RlOgo+IDI2LjA5LjIwMjAgMTE6MDcsIE5pY29saW4gQ2hlbiDQv9C40YjQtdGCOgo+IC4u
Lgo+ID4gKyNpZmRlZiBDT05GSUdfUENJCj4gPiArCWlmICghaW9tbXVfcHJlc2VudCgmcGNpX2J1
c190eXBlKSkgewo+IAo+IElzIHRoaXMgaW9tbXVfcHJlc2VudCgpIGNoZWNrIHJlYWxseSBuZWVk
ZWQ/Cj4gCj4gPiArCQlwY2lfcmVxdWVzdF9hY3MoKTsKPiAKPiBTaG91bGRuJ3QgcGNpX3JlcXVl
c3RfYWNzKCkgYmUgaW52b2tlZCAqYWZ0ZXIqIGJ1c19zZXRfaW9tbXUoKSBzdWNjZWVkcz8KCldp
bGwgbW92ZSBpdCBhZnRlciB0aGF0LiBUaGFua3MhCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmlvbW11IG1haWxpbmcgbGlzdAppb21tdUBsaXN0cy5saW51
eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1h
bi9saXN0aW5mby9pb21tdQ==
