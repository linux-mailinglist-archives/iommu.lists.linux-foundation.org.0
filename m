Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA0F34F2D9
	for <lists.iommu@lfdr.de>; Tue, 30 Mar 2021 23:12:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8AF483FB0;
	Tue, 30 Mar 2021 21:12:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8Kj4Az28QG_z; Tue, 30 Mar 2021 21:12:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03AD183FAF;
	Tue, 30 Mar 2021 21:12:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C2EE1C000A;
	Tue, 30 Mar 2021 21:12:45 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8FE6AC000A
 for <iommu@lists.linux-foundation.org>; Tue, 30 Mar 2021 21:12:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E4094037D
 for <iommu@lists.linux-foundation.org>; Tue, 30 Mar 2021 21:12:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3U3UUnB3ehDw for <iommu@lists.linux-foundation.org>;
 Tue, 30 Mar 2021 21:12:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 24E684034A
 for <iommu@lists.linux-foundation.org>; Tue, 30 Mar 2021 21:12:43 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id y12so5882716qtx.11
 for <iommu@lists.linux-foundation.org>; Tue, 30 Mar 2021 14:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=rvg5KeeLafDks20d9MA0DVK+cDxKZn2jW/3PZAzDQ/c=;
 b=k33NE2CXIobJjoB4dL34gEB0xWjLB3X1YdTxpiNE4m0w39+avHYjIPTlPYWXgE++hd
 CGQkltFiOHlY66qiAVKRvXxWVeakz1vHzUgjMGABg2PdcXzfe4r3i+hllFqwhr/VX80V
 uTac3mVQxYNW6lBVUmFdY/ZTI21BQcj9z97C+l86gNTTNqfOUpNO1cef3VITKGOdj5ZS
 ptEdf7sJdINv/ay1cfflAq7AeGQma+759sqdmJKNeuL+0T3qU0k3TxjPWmmAuFuQt/qP
 SnTM8sTfRkspWWUd4gwPfQngwZ66vFuqI7L5F8zrbvx6YUTXzNQsV6Apc9bQGppT2onR
 AZyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=rvg5KeeLafDks20d9MA0DVK+cDxKZn2jW/3PZAzDQ/c=;
 b=WYcMWmxW9lJ50M9GP/PrsJnT4rQLQsYsb2yAhYjMnw3Etssl1F41aUZkPvNgaj8pqm
 hg8aNgM0NLw/JX8znPWCib/KGKVC5DpvzJO7YMbyZL7/cAQWLpEQfcL7AN97J43TGNyA
 LIAf0CxK2U6oeKcR847LXKGZGDMs88PR71FGItcijElei99JsTefChEaDfNLdVkw/zPj
 iVoCpxR9DjmIFHNwYdRNw0EGy1Qz9O4+m4JbpIfMmqCgJK1i1rzX2cQefIcDEs9UVKNN
 UddRfxg/CmTsC6r4iPxidsyKb1b7jOMkFXOpbUxH54ooLRMpedCZ7OaHAtRRDoKMYUYF
 2Ipg==
X-Gm-Message-State: AOAM5311+NdW+JFlitA+pyYoluptwe9k+BSKvPEz0y8lgMlxz9Jml1q7
 TdLa71JiXRykl50rjwz5RTQ=
X-Google-Smtp-Source: ABdhPJzBICbv2tB+pZHOQUhX9mgUx+2f/OIMBmWy7u6Wt0v1ME2jB1BtLU0fWk8lwylmTW63ROdomw==
X-Received: by 2002:a05:622a:454:: with SMTP id
 o20mr28861530qtx.292.1617138762074; 
 Tue, 30 Mar 2021 14:12:42 -0700 (PDT)
Received: from Gentoo ([143.244.44.215])
 by smtp.gmail.com with ESMTPSA id b2sm119921qtb.54.2021.03.30.14.12.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Mar 2021 14:12:41 -0700 (PDT)
Date: Wed, 31 Mar 2021 02:42:21 +0530
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH 14/30] Revert "s3c24xx-dma.c: Fix a typo"
Message-ID: <YGOUNbCJOHLmeHm9@Gentoo>
Mail-Followup-To: Bhaskar Chowdhury <unixbhaskar@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hch@lst.de,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 dave.jiang@intel.com, dan.j.williams@intel.com,
 rdunlap@infradead.org, linux-kernel@vger.kernel.org
References: <cover.1616971780.git.unixbhaskar@gmail.com>
 <1d989f71fbebd15de633c187d88cb3be3a0f2723.1616971780.git.unixbhaskar@gmail.com>
 <YGNgFuLWc91aGoQj@vkoul-mobl.Dlink>
MIME-Version: 1.0
In-Reply-To: <YGNgFuLWc91aGoQj@vkoul-mobl.Dlink>
Cc: dave.jiang@intel.com, rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 dmaengine@vger.kernel.org, dan.j.williams@intel.com,
 linuxppc-dev@lists.ozlabs.org, hch@lst.de
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
Content-Type: multipart/mixed; boundary="===============6939639901505712488=="
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>


--===============6939639901505712488==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yapxdGUX50HbkJ4L"
Content-Disposition: inline


--yapxdGUX50HbkJ4L
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On 22:59 Tue 30 Mar 2021, Vinod Koul wrote:
>On 29-03-21, 05:23, Bhaskar Chowdhury wrote:
>> s/transferred/transfered/
>>
>> This reverts commit a2ddb8aea8106bd5552f8516ad7a8a26b9282a8f.
>
>This is not upstream, why not squash in. Also would make sense to write
>sensible changelog and not phrases and use the right subsystem
>conventions!
>
Changes like this don't deserve a history to tell, specific to changelog, one
line is suffice.

>Droped the series now
>
This is a bad commit slip in , not suppose to be there, thanks for catching
it.

Sorry for the noise.
>
>--
>~Vinod

--yapxdGUX50HbkJ4L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAmBjlDIACgkQsjqdtxFL
KRXbEQf9HOVQ3RETxBGqN9aTy39IsbyS5nu7/kFDhcZEJysEreLDXKPWNNQ2PX5w
cirIvKOlvWXDyrO8kTzZj7lyhdV4i20kBx+wWdBZ5Pzgxv7EsC29/u3MLwHH9eWk
/yvTPpfI8KLYpPNMU8bMS8NKR+hP+75gM0gGO4zmirTubaAIH9709n3MVg4A7Qlj
ZdJE1MCUqt+VHUnBqZzu2Afv10gBlrsy671OsH0K/m8/ZOWoIKg50Epc7s2/LPEg
DnYTel5gyXWtZh4thSXcjV0hm5Q6jzE0DQjGE7NDxeI8yIz4c6hZBJ2OOTXp1h2A
O5yOuKgqXzo95RFK6W9QSbfhv3erIA==
=mURO
-----END PGP SIGNATURE-----

--yapxdGUX50HbkJ4L--

--===============6939639901505712488==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
--===============6939639901505712488==--
