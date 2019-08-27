Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 034809F14B
	for <lists.iommu@lfdr.de>; Tue, 27 Aug 2019 19:13:48 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E2EFB18A1;
	Tue, 27 Aug 2019 17:13:45 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 9E1F914A3
	for <iommu@lists.linux-foundation.org>;
	Tue, 27 Aug 2019 17:13:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
	[209.85.167.193])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 50FCA710
	for <iommu@lists.linux-foundation.org>;
	Tue, 27 Aug 2019 17:13:44 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id h21so15556173oie.7
	for <iommu@lists.linux-foundation.org>;
	Tue, 27 Aug 2019 10:13:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=ZT59bHFCQxNUysxnKx4v2xMJcoeiALfAwa3rgtRRpmY=;
	b=Hv7qCjrYsv999+FyCvmCsipee+PqkTyt2ejk+xy1rvlePA0xLinpm9ukx9VQboKTtz
	nuNGckmd0g9jYt4JJFFV0aicrQVxaA1Zazd48MiLryupS+LRPeey6TzeUvdCohQgNqDV
	z2kH4OsUnVHGeAOvp4zHt1bOu9QUiOcnMCOfVOxXY4O459VMFgxRKT6S7Fn3hm2SIchr
	H7Mkjsq/Mu0sJnYV/bipg0bHTT5VoWjGb/Bw2Ixqkuj27VMw9XMvV1++E+eZIHjaLmJs
	3YrZXkJVderz4RPR6Jrz/L+EJ5XVhmKU6sNT4YHy/egAL6etuEI30vbWlCD5M6Vn7bhF
	OuUA==
X-Gm-Message-State: APjAAAUae3iiUXwMUO4alwElb+T29T75XEvAnw8piTmTzG5ybKAPOaoy
	N+gyV1q5fHR3RwNQOxaNrQ==
X-Google-Smtp-Source: APXvYqxslgK0PstOcKY7gHX+NFLxSs5mbQ5emm9JZKa41JXdGW49/ncn4EIxqEgVRmEBPuRT6rgQSg==
X-Received: by 2002:a54:4092:: with SMTP id i18mr5226801oii.66.1566926023468; 
	Tue, 27 Aug 2019 10:13:43 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
	[24.155.109.49])
	by smtp.gmail.com with ESMTPSA id f21sm5458620otq.7.2019.08.27.10.13.42
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 27 Aug 2019 10:13:42 -0700 (PDT)
Date: Tue, 27 Aug 2019 12:13:42 -0500
From: Rob Herring <robh@kernel.org>
To: Jordan Crouse <jcrouse@codeaurora.org>
Subject: Re: [PATCH 2/7] dt-bindings: arm-smmu: Add Adreno GPU variant
Message-ID: <20190827171342.GA29932@bogus>
References: <1566327992-362-1-git-send-email-jcrouse@codeaurora.org>
	<1566327992-362-3-git-send-email-jcrouse@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1566327992-362-3-git-send-email-jcrouse@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
	FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org, freedreno@lists.freedesktop.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On Tue, 20 Aug 2019 13:06:27 -0600, Jordan Crouse wrote:
> Add a compatible string to identify SMMUs that are attached
> to Adreno GPU devices that wish to support split pagetables.
> 
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
> 
>  Documentation/devicetree/bindings/iommu/arm,smmu.txt | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
