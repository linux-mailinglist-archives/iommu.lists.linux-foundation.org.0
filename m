Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1D527E0B1
	for <lists.iommu@lfdr.de>; Wed, 30 Sep 2020 07:54:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 857DD85700;
	Wed, 30 Sep 2020 05:54:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IzdHcuW2rTqH; Wed, 30 Sep 2020 05:54:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2744086709;
	Wed, 30 Sep 2020 05:54:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1A747C0051;
	Wed, 30 Sep 2020 05:54:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BA772C0051
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 05:54:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 8CCE520337
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 05:54:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MkLYWvWNjVux for <iommu@lists.linux-foundation.org>;
 Wed, 30 Sep 2020 05:54:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by silver.osuosl.org (Postfix) with ESMTPS id 7D4691FE65
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 05:54:32 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id kk9so267029pjb.2
 for <iommu@lists.linux-foundation.org>; Tue, 29 Sep 2020 22:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=nOrl7UHF0nNN9i5bc0fKWH998hHBJl4SyOt3Ewm9Qus=;
 b=EoXSmTFBLz6iFITy4oZtdW1ZnHZn57r24dAvaCKr0dCgY6ksM+DYPw/3J8cc6+ue8Y
 oDIQ4cbPRfyaJofzjxn4HYROLa1W6CrOqvDxZQPG1KubS40Nsw+hnIMQil+49AuqSozn
 wq9xpHCF5BCHrxyTpEWIpVzZGfDCg5TGbQbEijOakd26zI0Xl2YdFSrGheN0oaUXtyIE
 vxddY8iPvo/FUdYEtobOQvZ8DPT1QRRg5d25v51tM6r01JK0LtYHYfnu4xRsoMWhzcWq
 zqtAahE8VsWHAR/WpLTgEFuchOurn+3cHb7MUnishtQO/nCAlgNX6gyUkq1DkfEALXTl
 Hq7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=nOrl7UHF0nNN9i5bc0fKWH998hHBJl4SyOt3Ewm9Qus=;
 b=tHDgJg+YZ4nIcJid6pDnpu5VXSDjfKTd+sbKB4NieG+6xvheSt1w3l5MU1Q3yW3Kpu
 Jz9weee8SjMH6PJg9FWotJkcYyaNy9mqkztah+d/L0rPELvy699NhEjHG3Yvgtitemyo
 Su9jLzXcH3Qu+GEEwpm2/fCTn5iIDGMViTvSCY49zXHGN4oTkiL3tltrbzLIPiPpkCxj
 +ifblIJKQHJRdpEYessdbeUKdSFMaVcx8LT7dgCO9ydW1On1AV7oWkdJtN/g8E504zut
 79dhWYLehFhnPyfFSelZS5I/upIwu0xfPiITSEJ8UOAOqrXWLCm+mKcOr+v19uQNbZH0
 ueXg==
X-Gm-Message-State: AOAM531ZkjmPOPZC7/+h+mK0ZHXRKWfMQER31JhUoJZlOLOCXN990Ji3
 xTzULXW9g2aW07hWJ3P0qNY=
X-Google-Smtp-Source: ABdhPJyJBWhmdnNZa0VZas7IJXlcWAnavzrHh/Bboosyugl2BeI4Bn999Gi5I2W0kqRD0HfTE/LD0w==
X-Received: by 2002:a17:90a:c255:: with SMTP id
 d21mr1125704pjx.212.1601445272078; 
 Tue, 29 Sep 2020 22:54:32 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id s20sm719415pfu.112.2020.09.29.22.54.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 29 Sep 2020 22:54:31 -0700 (PDT)
Date: Tue, 29 Sep 2020 22:49:01 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 2/3] iommu/tegra-smmu: Rework .probe_device and
 .attach_dev
Message-ID: <20200930054900.GG31821@Asurada-Nvidia>
References: <20200930003013.31289-1-nicoleotsuka@gmail.com>
 <20200930003013.31289-3-nicoleotsuka@gmail.com>
 <75514da5-e63a-9e51-8376-abbd12c324d1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <75514da5-e63a-9e51-8376-abbd12c324d1@gmail.com>
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

T24gV2VkLCBTZXAgMzAsIDIwMjAgYXQgMDg6MTE6NTJBTSArMDMwMCwgRG1pdHJ5IE9zaXBlbmtv
IHdyb3RlOgo+IDMwLjA5LjIwMjAgMDM6MzAsIE5pY29saW4gQ2hlbiDQv9C40YjQtdGCOgo+ID4g
KwkvKiBBbiBpbnZhbGlkIG1jIHBvaW50ZXIgbWVhbnMgbWMgYW5kIHNtbXUgZHJpdmVycyBhcmUg
bm90IHJlYWR5ICovCj4gPiArCWlmIChJU19FUlJfT1JfTlVMTChtYykpCj4gCj4gdGVncmFfZ2V0
X21lbW9yeV9jb250cm9sbGVyKCkgZG9lc24ndCByZXR1cm4gTlVMTC4KCldlbGwsIEkgZG9uJ3Qg
d2FudCB0byBhc3N1bWUgdGhhdCBpdCdkIGRvIHRoYXQgZm9yZXZlciwgYW5kIHRoZQpOVUxMIGNo
ZWNrIG9mIElTX0VSUl9PUl9OVUxMIGlzIG1hcmtlZCAidW5saWtlbHkiIHNvIGl0IGRvZXNuJ3QK
aHVydCB0byBoYXZlLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwppb21tdSBtYWlsaW5nIGxpc3QKaW9tbXVAbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcK
aHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vaW9tbXU=
