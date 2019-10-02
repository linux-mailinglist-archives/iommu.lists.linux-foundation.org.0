Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B96C8AED
	for <lists.iommu@lfdr.de>; Wed,  2 Oct 2019 16:19:36 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 8EE5DEF8;
	Wed,  2 Oct 2019 14:19:32 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E0AE4EF1
	for <iommu@lists.linux-foundation.org>;
	Wed,  2 Oct 2019 14:19:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E51868A0
	for <iommu@lists.linux-foundation.org>;
	Wed,  2 Oct 2019 14:19:29 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id u22so15121015qkk.11
	for <iommu@lists.linux-foundation.org>;
	Wed, 02 Oct 2019 07:19:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:date:from:subject:references
	:in-reply-to:cc:cc:to;
	bh=VEtMxesFQRhVgaXfLOksqFQ3dcoeyOCvDlUvGQrsuFo=;
	b=kXXCyoGKY9O/JTiMCp9geS7hpcVkbR9A8Uo1wHZz+kgtY94214hC8+LbSq9wyfNR9p
	rmv0SjaSSPGVYSNZZ4lpECxJa242f4EsoJIV6UrK3c7DBA6xSdjCtNlVGNkTwPgH7lsR
	b0WMI8lF/UphxvJseKDhz++OFflnNh4w8XzdJxAVP9ONcgraYICUOgxeGHnN4Rxqi2zB
	7cNdx6SyouqIdQwRIYeGN+06HmUBAN1HCS6viFX2gI07mDSD3KJAuz/MtZyqYXhJkjfC
	ydHEBUHZ4CiTkRUAww2O3KK5z5RSKbZQ4yw9qw6yWGdiPderLAkFCEXcoGw3Fl6bMOKg
	+9mw==
X-Gm-Message-State: APjAAAUbgqq98Oj7fFxXTd0heX48dXL8MzmXWdZWcCH6tfRTca8GUenH
	06BCDwrhbzkpmDdfGgDdAw==
X-Google-Smtp-Source: APXvYqzagECSnvWAK2no15kXeuDvbNMmoSFzSS5uecaa8zyX8oPHLqD3j6y4NhItqADFSQbEDvOu5Q==
X-Received: by 2002:a37:a705:: with SMTP id q5mr3945294qke.194.1570025968939; 
	Wed, 02 Oct 2019 07:19:28 -0700 (PDT)
Received: from localhost ([132.205.230.8]) by smtp.gmail.com with ESMTPSA id
	b16sm14192592qtk.65.2019.10.02.07.19.28
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 02 Oct 2019 07:19:28 -0700 (PDT)
Message-ID: <5d94b1f0.1c69fb81.bc0b5.9a58@mx.google.com>
Date: Wed, 02 Oct 2019 09:19:25 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: iommu: ipmmu-vmsa: Add r8a774b1 support
References: <1569310854-37057-1-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1569310854-37057-1-git-send-email-biju.das@bp.renesas.com>
To: Biju Das <biju.das@bp.renesas.com>
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
	FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: , Mark Rutland <mark.rutland@arm.com>,
	Chris Paterson <Chris.Paterson2@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	devicetree@vger.kernel.org, Biju Das <biju.das@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org, iommu@lists.linux-foundation.org,
	Simon Horman <horms@verge.net.au>,
	Fabrizio Castro <fabrizio.castro@bp.renesas.com>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On Tue, 24 Sep 2019 08:40:54 +0100, Biju Das wrote:
> Document RZ/G2N (R8A774B1) SoC bindings.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
