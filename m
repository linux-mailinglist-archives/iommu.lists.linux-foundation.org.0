Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C431CE4B1
	for <lists.iommu@lfdr.de>; Mon, 11 May 2020 21:43:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 58F4B86ED4;
	Mon, 11 May 2020 19:43:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R1yowUbo8zq2; Mon, 11 May 2020 19:43:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DCE8386E40;
	Mon, 11 May 2020 19:43:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C368CC016F;
	Mon, 11 May 2020 19:43:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9AFF5C016F
 for <iommu@lists.linux-foundation.org>; Mon, 11 May 2020 19:43:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 889D6877DF
 for <iommu@lists.linux-foundation.org>; Mon, 11 May 2020 19:43:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4-ncQMRo686X for <iommu@lists.linux-foundation.org>;
 Mon, 11 May 2020 19:43:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id CAB2F877B4
 for <iommu@lists.linux-foundation.org>; Mon, 11 May 2020 19:43:50 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id p25so5192229pfn.11
 for <iommu@lists.linux-foundation.org>; Mon, 11 May 2020 12:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=4+TfwVXKgl+kCzrXzLvbtXwZoeSbQHCRrZFbCPATzF0=;
 b=B3Fuj2xS9vF2SEGI6Xmh49i0Ps/UE5wXP9tUU9qj2fDX2G7Lxv+YRKSOPuyDvlddDv
 ETcNZUmUS6KMOMSzB6bUc05QWaHt7YMuedWyW3+xvmAgD7PeLLqzn6wklbmQDOlW4pv8
 EvawUg2xIJvv+bBu0oGoC582VWszan8PBlTCo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=4+TfwVXKgl+kCzrXzLvbtXwZoeSbQHCRrZFbCPATzF0=;
 b=pxCNbxrY1YtMSfUAC5JJttVU1rp3RdBnSYIkWy+3hT/DwNix/I3TxaJxx0Vt2drJwN
 bAD5PapQxRkUceC3vKEKh0o9NXJdrnHt+HTnqQq1qKnXIU1h0VCg49MEnntgJgALPD7t
 knv8Q49UHBLRgQyYL65X/Bb+ubqUfVVur5L4F4WY7vYXj+FxHmvOZaQsdjLqm1qQylX0
 o9msqJlr6QqZEoYSuzAbAPIO0kdN8FLETcyPjhc3MfC/xaNgBTV+tSEGU7GIBhsIRE+M
 GlniMY4Y3/RETGsNuaOsZdygMaozqawo+SR9NyLHTc06phR7aGFpiwEuYGJuRxwOzvlt
 zfYg==
X-Gm-Message-State: AGi0Pua7R3BcKckuyx8FFX6VF71oAlZTRyAuuAyQNetjqBwCgwDeZeOe
 dv5MSNxDjrbUzm/V5w4TPPRHtnQjKFE=
X-Google-Smtp-Source: APiQypIcUFafUBeCy0rKTAZwm5qMdMe4CvAczlQJ0wpJxs6R6jWIuAB1kzwSF1szCKdbLPDVD2RDyA==
X-Received: by 2002:a17:902:8688:: with SMTP id
 g8mr17323717plo.268.1589225831184; 
 Mon, 11 May 2020 12:37:11 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
 by smtp.gmail.com with ESMTPSA id cv21sm11083259pjb.23.2020.05.11.12.37.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 12:37:10 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20200511175532.25874-1-sibis@codeaurora.org>
References: <20200511175532.25874-1-sibis@codeaurora.org>
Subject: Re: [PATCH v6] iommu/arm-smmu-qcom: Request direct mapping for modem
 device
From: Stephen Boyd <swboyd@chromium.org>
To: Sibi Sankar <sibis@codeaurora.org>, joro@8bytes.org, robin.murphy@arm.com,
 will@kernel.org
Date: Mon, 11 May 2020 12:37:09 -0700
Message-ID: <158922582972.26370.14084228362776489859@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Cc: linux-arm-msm@vger.kernel.org, dianders@chromium.org, evgreen@chromium.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 mka@chromium.org, Sibi Sankar <sibis@codeaurora.org>,
 bjorn.andersson@linaro.org, linux-arm-kernel@lists.infradead.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Quoting Sibi Sankar (2020-05-11 10:55:32)
> The modem remote processor has two access paths to DDR. One path is
> directly connected to DDR and another path goes through an SMMU. The
> SMMU path is configured to be a direct mapping because it's used by
> various peripherals in the modem subsystem. Typically this direct
> mapping is configured statically at EL2 by QHEE (Qualcomm's Hypervisor
> Execution Environment) before the kernel is entered.
> 
> In certain firmware configuration, especially when the kernel is already
> in full control of the SMMU, defer programming the modem SIDs to the
> kernel. Let's add compatibles here so that we can have the kernel
> program the SIDs for the modem in these cases.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
